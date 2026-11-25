#include <stdlib.h>
#include <string.h>
#include "bytecode.h"

BytecodeChunk *bytecode_chunk_new(void) {
    BytecodeChunk *chunk = (BytecodeChunk *)calloc(1, sizeof(BytecodeChunk));
    chunk->code_capacity = 64;
    chunk->code = (uint8_t *)malloc(chunk->code_capacity);
    chunk->constant_capacity = 8;
    chunk->constants = (Value *)malloc(sizeof(Value) * chunk->constant_capacity);
    return chunk;
}

void bytecode_chunk_free(BytecodeChunk *chunk) {
    if (!chunk) return;
    free(chunk->code);
    free(chunk->constants);
    free(chunk);
}

size_t bytecode_chunk_add_const(BytecodeChunk *chunk, Value val) {
    if (!chunk) return 0;
    if (chunk->constant_count >= chunk->constant_capacity) {
        chunk->constant_capacity *= 2;
        chunk->constants = (Value *)realloc(chunk->constants, sizeof(Value) * chunk->constant_capacity);
    }
    size_t idx = chunk->constant_count++;
    chunk->constants[idx] = val;
    return idx;
}

void bytecode_chunk_emit_byte(BytecodeChunk *chunk, uint8_t byte) {
    if (!chunk) return;
    if (chunk->code_size >= chunk->code_capacity) {
        chunk->code_capacity *= 2;
        chunk->code = (uint8_t *)realloc(chunk->code, chunk->code_capacity);
    }
    chunk->code[chunk->code_size++] = byte;
}

void bytecode_chunk_emit_u16(BytecodeChunk *chunk, uint16_t val) {
    bytecode_chunk_emit_byte(chunk, (uint8_t)(val & 0xFF));
    bytecode_chunk_emit_byte(chunk, (uint8_t)((val >> 8) & 0xFF));
}

void bytecode_chunk_emit_i32(BytecodeChunk *chunk, int32_t val) {
    uint32_t u = (uint32_t)val;
    bytecode_chunk_emit_byte(chunk, (uint8_t)(u & 0xFF));
    bytecode_chunk_emit_byte(chunk, (uint8_t)((u >> 8) & 0xFF));
    bytecode_chunk_emit_byte(chunk, (uint8_t)((u >> 16) & 0xFF));
    bytecode_chunk_emit_byte(chunk, (uint8_t)((u >> 24) & 0xFF));
}

void bytecode_chunk_emit_i64(BytecodeChunk *chunk, int64_t val) {
    uint64_t u = (uint64_t)val;
    for (int i = 0; i < 8; i++) {
        bytecode_chunk_emit_byte(chunk, (uint8_t)((u >> (i * 8)) & 0xFF));
    }
}

void bytecode_chunk_patch_i32(BytecodeChunk *chunk, size_t offset, int32_t val) {
    if (!chunk || offset + 4 > chunk->code_size) return;
    uint32_t u = (uint32_t)val;
    chunk->code[offset]     = (uint8_t)(u & 0xFF);
    chunk->code[offset + 1] = (uint8_t)((u >> 8) & 0xFF);
    chunk->code[offset + 2] = (uint8_t)((u >> 16) & 0xFF);
    chunk->code[offset + 3] = (uint8_t)((u >> 24) & 0xFF);
}
