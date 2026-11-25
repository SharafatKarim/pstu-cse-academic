#include <stdio.h>
#include <inttypes.h>
#include "disasm.h"

static int16_t read_u16(const uint8_t *code, size_t offset) {
    return (uint16_t)(code[offset] | (code[offset + 1] << 8));
}

static int32_t read_i32(const uint8_t *code, size_t offset) {
    uint32_t u = (uint32_t)code[offset] |
                 ((uint32_t)code[offset + 1] << 8) |
                 ((uint32_t)code[offset + 2] << 16) |
                 ((uint32_t)code[offset + 3] << 24);
    return (int32_t)u;
}

static int64_t read_i64(const uint8_t *code, size_t offset) {
    uint64_t u = 0;
    for (int i = 0; i < 8; i++) {
        u |= ((uint64_t)code[offset + i]) << (i * 8);
    }
    return (int64_t)u;
}

size_t disasm_instruction(const BytecodeChunk *chunk, size_t offset, FILE *out) {
    if (!chunk || offset >= chunk->code_size) return offset;
    const uint8_t *code = chunk->code;
    uint8_t op = code[offset];

    fprintf(out, "%04zu: ", offset);

    switch (op) {
        case OP_NOP:         fprintf(out, "NOP\n"); return offset + 1;
        case OP_POP:         fprintf(out, "POP\n"); return offset + 1;
        case OP_PUSH_I: {
            int64_t val = read_i64(code, offset + 1);
            fprintf(out, "PUSH_I %" PRId64 "\n", val);
            return offset + 1 + 8;
        }
        case OP_PUSH_CONST: {
            uint16_t idx = read_u16(code, offset + 1);
            double val = (idx < chunk->constant_count) ? chunk->constants[idx].f : 0.0;
            fprintf(out, "PUSH_CONST %u (float: %f)\n", idx, val);
            return offset + 1 + 2;
        }
        case OP_LOAD_LOCAL: {
            uint16_t slot = read_u16(code, offset + 1);
            fprintf(out, "LOAD_LOCAL %u\n", slot);
            return offset + 1 + 2;
        }
        case OP_STORE_LOCAL: {
            uint16_t slot = read_u16(code, offset + 1);
            fprintf(out, "STORE_LOCAL %u\n", slot);
            return offset + 1 + 2;
        }
        case OP_ADD_I:       fprintf(out, "ADD_I\n"); return offset + 1;
        case OP_SUB_I:       fprintf(out, "SUB_I\n"); return offset + 1;
        case OP_MUL_I:       fprintf(out, "MUL_I\n"); return offset + 1;
        case OP_DIV_I:       fprintf(out, "DIV_I\n"); return offset + 1;
        case OP_NEG_I:       fprintf(out, "NEG_I\n"); return offset + 1;
        case OP_ADD_F:       fprintf(out, "ADD_F\n"); return offset + 1;
        case OP_SUB_F:       fprintf(out, "SUB_F\n"); return offset + 1;
        case OP_MUL_F:       fprintf(out, "MUL_F\n"); return offset + 1;
        case OP_DIV_F:       fprintf(out, "DIV_F\n"); return offset + 1;
        case OP_NEG_F:       fprintf(out, "NEG_F\n"); return offset + 1;
        case OP_I2F:         fprintf(out, "I2F\n"); return offset + 1;
        case OP_F2I:         fprintf(out, "F2I\n"); return offset + 1;
        case OP_CMP_EQ_I:    fprintf(out, "CMP_EQ_I\n"); return offset + 1;
        case OP_CMP_NE_I:    fprintf(out, "CMP_NE_I\n"); return offset + 1;
        case OP_CMP_LT_I:    fprintf(out, "CMP_LT_I\n"); return offset + 1;
        case OP_CMP_GT_I:    fprintf(out, "CMP_GT_I\n"); return offset + 1;
        case OP_CMP_LE_I:    fprintf(out, "CMP_LE_I\n"); return offset + 1;
        case OP_CMP_GE_I:    fprintf(out, "CMP_GE_I\n"); return offset + 1;
        case OP_CMP_EQ_F:    fprintf(out, "CMP_EQ_F\n"); return offset + 1;
        case OP_CMP_NE_F:    fprintf(out, "CMP_NE_F\n"); return offset + 1;
        case OP_CMP_LT_F:    fprintf(out, "CMP_LT_F\n"); return offset + 1;
        case OP_CMP_GT_F:    fprintf(out, "CMP_GT_F\n"); return offset + 1;
        case OP_CMP_LE_F:    fprintf(out, "CMP_LE_F\n"); return offset + 1;
        case OP_CMP_GE_F:    fprintf(out, "CMP_GE_F\n"); return offset + 1;
        case OP_JMP: {
            int32_t rel = read_i32(code, offset + 1);
            size_t target = (size_t)((int64_t)(offset + 5) + rel);
            fprintf(out, "JMP %+d -> [%04zu]\n", rel, target);
            return offset + 1 + 4;
        }
        case OP_JZ: {
            int32_t rel = read_i32(code, offset + 1);
            size_t target = (size_t)((int64_t)(offset + 5) + rel);
            fprintf(out, "JZ %+d -> [%04zu]\n", rel, target);
            return offset + 1 + 4;
        }
        case OP_JNZ: {
            int32_t rel = read_i32(code, offset + 1);
            size_t target = (size_t)((int64_t)(offset + 5) + rel);
            fprintf(out, "JNZ %+d -> [%04zu]\n", rel, target);
            return offset + 1 + 4;
        }
        case OP_PRINT_I:     fprintf(out, "PRINT_I\n"); return offset + 1;
        case OP_PRINT_F:     fprintf(out, "PRINT_F\n"); return offset + 1;
        case OP_PRINT_NL:    fprintf(out, "PRINT_NL\n"); return offset + 1;
        case OP_HALT:        fprintf(out, "HALT\n"); return offset + 1;
        default:
            fprintf(out, "UNKNOWN_OP (0x%02X)\n", op);
            return offset + 1;
    }
}

void disasm_chunk(const BytecodeChunk *chunk, FILE *out) {
    if (!chunk) return;
    fprintf(out, "=== Bytecode Disassembly ===\n");
    fprintf(out, "Header: locals=%u, code_size=%zu, const_count=%zu\n",
            chunk->locals_count, chunk->code_size, chunk->constant_count);

    if (chunk->constant_count > 0) {
        fprintf(out, "--- Constant Pool ---\n");
        for (size_t i = 0; i < chunk->constant_count; i++) {
            fprintf(out, "  [%02zu] float %f\n", i, chunk->constants[i].f);
        }
    }

    fprintf(out, "--- Code Stream ---\n");
    size_t offset = 0;
    while (offset < chunk->code_size) {
        offset = disasm_instruction(chunk, offset, out);
    }
    fprintf(out, "============================\n");
}
