#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <inttypes.h>
#include "vm.h"
#include "disasm.h"

void vm_init(VM *vm, const uint8_t *code, size_t code_size, const Value *constants, size_t const_count, size_t locals_count) {
    memset(vm, 0, sizeof(VM));
    vm->code = code;
    vm->code_size = code_size;
    vm->constants = constants;
    vm->constant_count = const_count;
    vm->locals_count = locals_count;
    if (locals_count > 0) {
        vm->locals = (Value *)calloc(locals_count, sizeof(Value));
    }
    vm->ip = 0;
    vm->sp = 0;
    vm->trace_mode = false;
    vm->owns_code = false;
    vm->owns_constants = false;
}

bool vm_load_file(VM *vm, const char *path) {
    FILE *f = fopen(path, "rb");
    if (!f) {
        fprintf(stderr, "VM Error: cannot open bytecode file '%s'\n", path);
        return false;
    }

    MBCHeader header;
    if (fread(&header, sizeof(MBCHeader), 1, f) != 1) {
        fprintf(stderr, "VM Error: corrupt or incomplete bytecode header in '%s'\n", path);
        fclose(f);
        return false;
    }

    if (memcmp(header.magic, MBC_MAGIC, 4) != 0) {
        fprintf(stderr, "VM Error: invalid bytecode signature in '%s'\n", path);
        fclose(f);
        return false;
    }

    Value *constants = NULL;
    if (header.constant_count > 0) {
        constants = (Value *)malloc(sizeof(Value) * header.constant_count);
        for (uint32_t i = 0; i < header.constant_count; i++) {
            uint8_t tag = 0;
            if (fread(&tag, 1, 1, f) != 1 || tag != CONST_TAG_FLOAT ||
                fread(&constants[i].f, sizeof(double), 1, f) != 1) {
                fprintf(stderr, "VM Error: corrupt constant pool entry in '%s'\n", path);
                free(constants);
                fclose(f);
                return false;
            }
        }
    }

    uint8_t *code = (uint8_t *)malloc(header.code_size);
    if (header.code_size > 0 && fread(code, 1, header.code_size, f) != header.code_size) {
        fprintf(stderr, "VM Error: corrupt code stream in '%s'\n", path);
        free(constants);
        free(code);
        fclose(f);
        return false;
    }

    fclose(f);

    vm_init(vm, code, header.code_size, constants, header.constant_count, header.locals_count);
    vm->owns_code = true;
    vm->owns_constants = true;
    vm->ip = header.entry_point;
    return true;
}

void vm_free(VM *vm) {
    if (!vm) return;
    if (vm->locals) {
        free(vm->locals);
        vm->locals = NULL;
    }
    if (vm->owns_code && vm->code) {
        free((void *)vm->code);
        vm->code = NULL;
    }
    if (vm->owns_constants && vm->constants) {
        free((void *)vm->constants);
        vm->constants = NULL;
    }
}

static inline void push(VM *vm, Value val) {
    if (vm->sp >= VM_STACK_MAX) {
        fprintf(stderr, "VM Error: stack overflow\n");
        exit(VM_RUNTIME_ERR_STACK);
    }
    vm->stack[vm->sp++] = val;
}

static inline Value pop(VM *vm) {
    if (vm->sp == 0) {
        fprintf(stderr, "VM Error: stack underflow\n");
        exit(VM_RUNTIME_ERR_STACK);
    }
    return vm->stack[--vm->sp];
}

static inline uint16_t read_u16(VM *vm) {
    uint16_t u = (uint16_t)(vm->code[vm->ip] | (vm->code[vm->ip + 1] << 8));
    vm->ip += 2;
    return u;
}

static inline int32_t read_i32(VM *vm) {
    uint32_t u = (uint32_t)vm->code[vm->ip] |
                 ((uint32_t)vm->code[vm->ip + 1] << 8) |
                 ((uint32_t)vm->code[vm->ip + 2] << 16) |
                 ((uint32_t)vm->code[vm->ip + 3] << 24);
    vm->ip += 4;
    return (int32_t)u;
}

static inline int64_t read_i64(VM *vm) {
    uint64_t u = 0;
    for (int i = 0; i < 8; i++) {
        u |= ((uint64_t)vm->code[vm->ip + i]) << (i * 8);
    }
    vm->ip += 8;
    return (int64_t)u;
}

static void print_trace_stack(const VM *vm) {
    printf(" | Stack [%zu]: [ ", vm->sp);
    for (size_t i = 0; i < vm->sp; i++) {
        printf("%" PRId64 " ", vm->stack[i].i);
    }
    printf("]\n");
}

int vm_run(VM *vm) {
    if (!vm || !vm->code) return 0;

    BytecodeChunk temp_chunk;
    temp_chunk.code = (uint8_t *)vm->code;
    temp_chunk.code_size = vm->code_size;
    temp_chunk.constants = (Value *)vm->constants;
    temp_chunk.constant_count = vm->constant_count;
    temp_chunk.locals_count = (uint32_t)vm->locals_count;

    while (vm->ip < vm->code_size) {
        size_t current_ip = vm->ip;

        if (vm->trace_mode) {
            disasm_instruction(&temp_chunk, current_ip, stdout);
        }

        uint8_t op = vm->code[vm->ip++];

        switch (op) {
            case OP_NOP:
                break;

            case OP_POP:
                (void)pop(vm);
                break;

            case OP_PUSH_I: {
                int64_t v = read_i64(vm);
                Value val; val.i = v;
                push(vm, val);
                break;
            }

            case OP_PUSH_CONST: {
                uint16_t idx = read_u16(vm);
                if (idx < vm->constant_count) {
                    push(vm, vm->constants[idx]);
                } else {
                    fprintf(stderr, "VM Error: invalid constant index %u\n", idx);
                    return VM_RUNTIME_ERR_INVALID_BYTECODE;
                }
                break;
            }

            case OP_LOAD_LOCAL: {
                uint16_t slot = read_u16(vm);
                if (slot < vm->locals_count) {
                    push(vm, vm->locals[slot]);
                } else {
                    fprintf(stderr, "VM Error: invalid local slot %u\n", slot);
                    return VM_RUNTIME_ERR_INVALID_BYTECODE;
                }
                break;
            }

            case OP_STORE_LOCAL: {
                uint16_t slot = read_u16(vm);
                if (slot < vm->locals_count) {
                    vm->locals[slot] = pop(vm);
                } else {
                    fprintf(stderr, "VM Error: invalid local slot %u\n", slot);
                    return VM_RUNTIME_ERR_INVALID_BYTECODE;
                }
                break;
            }

            case OP_ADD_I: {
                int64_t b = pop(vm).i;
                int64_t a = pop(vm).i;
                Value val; val.i = a + b;
                push(vm, val);
                break;
            }

            case OP_SUB_I: {
                int64_t b = pop(vm).i;
                int64_t a = pop(vm).i;
                Value val; val.i = a - b;
                push(vm, val);
                break;
            }

            case OP_MUL_I: {
                int64_t b = pop(vm).i;
                int64_t a = pop(vm).i;
                Value val; val.i = a * b;
                push(vm, val);
                break;
            }

            case OP_DIV_I: {
                int64_t b = pop(vm).i;
                int64_t a = pop(vm).i;
                if (b == 0) {
                    fprintf(stderr, "Runtime Error: Division by zero\n");
                    return VM_RUNTIME_ERR_DIV_BY_ZERO;
                }
                Value val; val.i = a / b;
                push(vm, val);
                break;
            }

            case OP_NEG_I: {
                int64_t a = pop(vm).i;
                Value val; val.i = -a;
                push(vm, val);
                break;
            }

            case OP_ADD_F: {
                double b = pop(vm).f;
                double a = pop(vm).f;
                Value val; val.f = a + b;
                push(vm, val);
                break;
            }

            case OP_SUB_F: {
                double b = pop(vm).f;
                double a = pop(vm).f;
                Value val; val.f = a - b;
                push(vm, val);
                break;
            }

            case OP_MUL_F: {
                double b = pop(vm).f;
                double a = pop(vm).f;
                Value val; val.f = a * b;
                push(vm, val);
                break;
            }

            case OP_DIV_F: {
                double b = pop(vm).f;
                double a = pop(vm).f;
                if (b == 0.0) {
                    fprintf(stderr, "Runtime Error: Division by zero\n");
                    return VM_RUNTIME_ERR_DIV_BY_ZERO;
                }
                Value val; val.f = a / b;
                push(vm, val);
                break;
            }

            case OP_NEG_F: {
                double a = pop(vm).f;
                Value val; val.f = -a;
                push(vm, val);
                break;
            }

            case OP_I2F: {
                int64_t a = pop(vm).i;
                Value val; val.f = (double)a;
                push(vm, val);
                break;
            }

            case OP_F2I: {
                double a = pop(vm).f;
                Value val; val.i = (int64_t)a;
                push(vm, val);
                break;
            }

            case OP_CMP_EQ_I: {
                int64_t b = pop(vm).i;
                int64_t a = pop(vm).i;
                Value val; val.i = (a == b) ? 1 : 0;
                push(vm, val);
                break;
            }

            case OP_CMP_NE_I: {
                int64_t b = pop(vm).i;
                int64_t a = pop(vm).i;
                Value val; val.i = (a != b) ? 1 : 0;
                push(vm, val);
                break;
            }

            case OP_CMP_LT_I: {
                int64_t b = pop(vm).i;
                int64_t a = pop(vm).i;
                Value val; val.i = (a < b) ? 1 : 0;
                push(vm, val);
                break;
            }

            case OP_CMP_GT_I: {
                int64_t b = pop(vm).i;
                int64_t a = pop(vm).i;
                Value val; val.i = (a > b) ? 1 : 0;
                push(vm, val);
                break;
            }

            case OP_CMP_LE_I: {
                int64_t b = pop(vm).i;
                int64_t a = pop(vm).i;
                Value val; val.i = (a <= b) ? 1 : 0;
                push(vm, val);
                break;
            }

            case OP_CMP_GE_I: {
                int64_t b = pop(vm).i;
                int64_t a = pop(vm).i;
                Value val; val.i = (a >= b) ? 1 : 0;
                push(vm, val);
                break;
            }

            case OP_CMP_EQ_F: {
                double b = pop(vm).f;
                double a = pop(vm).f;
                Value val; val.i = (a == b) ? 1 : 0;
                push(vm, val);
                break;
            }

            case OP_CMP_NE_F: {
                double b = pop(vm).f;
                double a = pop(vm).f;
                Value val; val.i = (a != b) ? 1 : 0;
                push(vm, val);
                break;
            }

            case OP_CMP_LT_F: {
                double b = pop(vm).f;
                double a = pop(vm).f;
                Value val; val.i = (a < b) ? 1 : 0;
                push(vm, val);
                break;
            }

            case OP_CMP_GT_F: {
                double b = pop(vm).f;
                double a = pop(vm).f;
                Value val; val.i = (a > b) ? 1 : 0;
                push(vm, val);
                break;
            }

            case OP_CMP_LE_F: {
                double b = pop(vm).f;
                double a = pop(vm).f;
                Value val; val.i = (a <= b) ? 1 : 0;
                push(vm, val);
                break;
            }

            case OP_CMP_GE_F: {
                double b = pop(vm).f;
                double a = pop(vm).f;
                Value val; val.i = (a >= b) ? 1 : 0;
                push(vm, val);
                break;
            }

            case OP_JMP: {
                int32_t rel = read_i32(vm);
                vm->ip = (size_t)((int64_t)vm->ip + rel);
                break;
            }

            case OP_JZ: {
                int32_t rel = read_i32(vm);
                int64_t cond = pop(vm).i;
                if (!cond) {
                    vm->ip = (size_t)((int64_t)vm->ip + rel);
                }
                break;
            }

            case OP_JNZ: {
                int32_t rel = read_i32(vm);
                int64_t cond = pop(vm).i;
                if (cond) {
                    vm->ip = (size_t)((int64_t)vm->ip + rel);
                }
                break;
            }

            case OP_PRINT_I: {
                int64_t v = pop(vm).i;
                printf("%" PRId64, v);
                fflush(stdout);
                break;
            }

            case OP_PRINT_F: {
                double v = pop(vm).f;
                printf("%f", v);
                fflush(stdout);
                break;
            }

            case OP_PRINT_NL:
                printf("\n");
                fflush(stdout);
                break;

            case OP_HALT:
                if (vm->trace_mode) {
                    print_trace_stack(vm);
                }
                if (vm->sp > 0) {
                    return (int)vm->stack[vm->sp - 1].i;
                }
                return 0;

            default:
                fprintf(stderr, "VM Error: unknown opcode 0x%02X at offset %04zu\n", op, current_ip);
                return VM_RUNTIME_ERR_INVALID_BYTECODE;
        }

        if (vm->trace_mode) {
            print_trace_stack(vm);
        }
    }

    return 0;
}
