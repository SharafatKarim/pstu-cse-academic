#ifndef MINIC_VM_H
#define MINIC_VM_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#include "../common/value.h"
#include "bytecode.h"

#define VM_STACK_MAX 1024
#define VM_RUNTIME_ERR_DIV_BY_ZERO 2
#define VM_RUNTIME_ERR_STACK 3
#define VM_RUNTIME_ERR_INVALID_BYTECODE 4

typedef struct {
    const uint8_t *code;
    size_t code_size;
    size_t ip;

    const Value *constants;
    size_t constant_count;

    Value *locals;
    size_t locals_count;

    Value stack[VM_STACK_MAX];
    size_t sp;

    bool trace_mode;
    bool owns_code;
    bool owns_constants;
} VM;

void vm_init(VM *vm, const uint8_t *code, size_t code_size, const Value *constants, size_t const_count, size_t locals_count);
bool vm_load_file(VM *vm, const char *path);
int vm_run(VM *vm);
void vm_free(VM *vm);

#endif
