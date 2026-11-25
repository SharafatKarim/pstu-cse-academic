#include <stdio.h>
#include <assert.h>
#include <string.h>
#include "../common/value.h"
#include "../vm/bytecode.h"
#include "../vm/vm.h"

int main(void) {
    printf("=== Testing Stack VM Runtime ===\n");

    // Test 1: Integer arithmetic: 20 + 30 = 50, return 50
    {
        BytecodeChunk *chunk = bytecode_chunk_new();
        chunk->locals_count = 1;
        bytecode_chunk_emit_byte(chunk, OP_PUSH_I);
        bytecode_chunk_emit_i64(chunk, 20);
        bytecode_chunk_emit_byte(chunk, OP_PUSH_I);
        bytecode_chunk_emit_i64(chunk, 30);
        bytecode_chunk_emit_byte(chunk, OP_ADD_I);
        bytecode_chunk_emit_byte(chunk, OP_STORE_LOCAL);
        bytecode_chunk_emit_u16(chunk, 0);
        bytecode_chunk_emit_byte(chunk, OP_LOAD_LOCAL);
        bytecode_chunk_emit_u16(chunk, 0);
        bytecode_chunk_emit_byte(chunk, OP_HALT);

        VM vm;
        vm_init(&vm, chunk->code, chunk->code_size, chunk->constants, chunk->constant_count, chunk->locals_count);
        vm.trace_mode = true;
        printf("\n--- Test 1 VM Trace ---\n");
        int res = vm_run(&vm);
        assert(res == 50);
        vm_free(&vm);
        bytecode_chunk_free(chunk);
        printf("[PASS] Test 1: Integer arithmetic returned 50\n");
    }

    // Test 2: Float math & conversion: int 10 converted to float, multiplied by 2.5 = 25.0
    {
        BytecodeChunk *chunk = bytecode_chunk_new();
        chunk->locals_count = 0;
        Value fval; fval.f = 2.5;
        size_t c_idx = bytecode_chunk_add_const(chunk, fval);

        bytecode_chunk_emit_byte(chunk, OP_PUSH_I);
        bytecode_chunk_emit_i64(chunk, 10);
        bytecode_chunk_emit_byte(chunk, OP_I2F);
        bytecode_chunk_emit_byte(chunk, OP_PUSH_CONST);
        bytecode_chunk_emit_u16(chunk, (uint16_t)c_idx);
        bytecode_chunk_emit_byte(chunk, OP_MUL_F);
        // Cast back to int to return exit code
        bytecode_chunk_emit_byte(chunk, OP_F2I);
        bytecode_chunk_emit_byte(chunk, OP_HALT);

        VM vm;
        vm_init(&vm, chunk->code, chunk->code_size, chunk->constants, chunk->constant_count, chunk->locals_count);
        int res = vm_run(&vm);
        assert(res == 25);
        vm_free(&vm);
        bytecode_chunk_free(chunk);
        printf("[PASS] Test 2: Float math and I2F/F2I returned 25\n");
    }

    // Test 3: Loop execution: sum 1 to 10
    // local 0: i = 1, local 1: sum = 0
    {
        BytecodeChunk *chunk = bytecode_chunk_new();
        chunk->locals_count = 2;

        // i = 1
        bytecode_chunk_emit_byte(chunk, OP_PUSH_I);
        bytecode_chunk_emit_i64(chunk, 1);
        bytecode_chunk_emit_byte(chunk, OP_STORE_LOCAL);
        bytecode_chunk_emit_u16(chunk, 0);

        // sum = 0
        bytecode_chunk_emit_byte(chunk, OP_PUSH_I);
        bytecode_chunk_emit_i64(chunk, 0);
        bytecode_chunk_emit_byte(chunk, OP_STORE_LOCAL);
        bytecode_chunk_emit_u16(chunk, 1);

        // loop start: condition (i <= 10)
        size_t loop_start = chunk->code_size;
        bytecode_chunk_emit_byte(chunk, OP_LOAD_LOCAL);
        bytecode_chunk_emit_u16(chunk, 0);
        bytecode_chunk_emit_byte(chunk, OP_PUSH_I);
        bytecode_chunk_emit_i64(chunk, 10);
        bytecode_chunk_emit_byte(chunk, OP_CMP_LE_I);
        bytecode_chunk_emit_byte(chunk, OP_JZ);
        size_t exit_patch = chunk->code_size;
        bytecode_chunk_emit_i32(chunk, 0);

        // body: sum = sum + i
        bytecode_chunk_emit_byte(chunk, OP_LOAD_LOCAL);
        bytecode_chunk_emit_u16(chunk, 1);
        bytecode_chunk_emit_byte(chunk, OP_LOAD_LOCAL);
        bytecode_chunk_emit_u16(chunk, 0);
        bytecode_chunk_emit_byte(chunk, OP_ADD_I);
        bytecode_chunk_emit_byte(chunk, OP_STORE_LOCAL);
        bytecode_chunk_emit_u16(chunk, 1);

        // body: i = i + 1
        bytecode_chunk_emit_byte(chunk, OP_LOAD_LOCAL);
        bytecode_chunk_emit_u16(chunk, 0);
        bytecode_chunk_emit_byte(chunk, OP_PUSH_I);
        bytecode_chunk_emit_i64(chunk, 1);
        bytecode_chunk_emit_byte(chunk, OP_ADD_I);
        bytecode_chunk_emit_byte(chunk, OP_STORE_LOCAL);
        bytecode_chunk_emit_u16(chunk, 0);

        // jump back to loop start
        bytecode_chunk_emit_byte(chunk, OP_JMP);
        int32_t rel_back = (int32_t)((int64_t)loop_start - (int64_t)(chunk->code_size + 4));
        bytecode_chunk_emit_i32(chunk, rel_back);

        // patch exit
        int32_t rel_exit = (int32_t)(chunk->code_size - (exit_patch + 4));
        bytecode_chunk_patch_i32(chunk, exit_patch, rel_exit);

        // return sum
        bytecode_chunk_emit_byte(chunk, OP_LOAD_LOCAL);
        bytecode_chunk_emit_u16(chunk, 1);
        bytecode_chunk_emit_byte(chunk, OP_HALT);

        VM vm;
        vm_init(&vm, chunk->code, chunk->code_size, chunk->constants, chunk->constant_count, chunk->locals_count);
        int res = vm_run(&vm);
        assert(res == 55);
        vm_free(&vm);
        bytecode_chunk_free(chunk);
        printf("[PASS] Test 3: Loop iteration sum(1..10) = 55\n");
    }

    // Test 4: Division by zero trap -> returns 2
    {
        BytecodeChunk *chunk = bytecode_chunk_new();
        chunk->locals_count = 0;
        bytecode_chunk_emit_byte(chunk, OP_PUSH_I);
        bytecode_chunk_emit_i64(chunk, 42);
        bytecode_chunk_emit_byte(chunk, OP_PUSH_I);
        bytecode_chunk_emit_i64(chunk, 0);
        bytecode_chunk_emit_byte(chunk, OP_DIV_I);
        bytecode_chunk_emit_byte(chunk, OP_HALT);

        VM vm;
        vm_init(&vm, chunk->code, chunk->code_size, chunk->constants, chunk->constant_count, chunk->locals_count);
        int res = vm_run(&vm);
        assert(res == 2);
        vm_free(&vm);
        bytecode_chunk_free(chunk);
        printf("[PASS] Test 4: Division by zero cleanly returned code 2\n");
    }

    printf("\nAll VM tests passed successfully!\n");
    return 0;
}
