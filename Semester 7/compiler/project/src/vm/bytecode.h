#ifndef MINIC_BYTECODE_H
#define MINIC_BYTECODE_H

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
#include "../common/value.h"

#define MBC_MAGIC "\x7fMBC"
#define MBC_VERSION 0x0001

#define CONST_TAG_FLOAT 0x01

#pragma pack(push, 1)
typedef struct {
    uint8_t  magic[4];          // "\x7fMBC"
    uint16_t version;           // 0x0001
    uint16_t flags;             // Reserved 0x0000
    uint32_t constant_count;    // Little-endian
    uint32_t code_size;         // Little-endian
    uint32_t locals_count;      // Little-endian
    uint32_t entry_point;       // Little-endian
} MBCHeader;
#pragma pack(pop)

typedef enum {
    OP_NOP          = 0x00,
    OP_POP          = 0x01,
    OP_PUSH_I      = 0x02,
    OP_PUSH_CONST   = 0x03,
    OP_LOAD_LOCAL   = 0x04,
    OP_STORE_LOCAL  = 0x05,

    OP_ADD_I        = 0x10,
    OP_SUB_I        = 0x11,
    OP_MUL_I        = 0x12,
    OP_DIV_I        = 0x13,
    OP_NEG_I        = 0x14,

    OP_ADD_F        = 0x20,
    OP_SUB_F        = 0x21,
    OP_MUL_F        = 0x22,
    OP_DIV_F        = 0x23,
    OP_NEG_F        = 0x24,

    OP_I2F          = 0x30,
    OP_F2I          = 0x31,

    OP_CMP_EQ_I     = 0x40,
    OP_CMP_NE_I     = 0x41,
    OP_CMP_LT_I     = 0x42,
    OP_CMP_GT_I     = 0x43,
    OP_CMP_LE_I     = 0x44,
    OP_CMP_GE_I     = 0x45,

    OP_CMP_EQ_F     = 0x50,
    OP_CMP_NE_F     = 0x51,
    OP_CMP_LT_F     = 0x52,
    OP_CMP_GT_F     = 0x53,
    OP_CMP_LE_F     = 0x54,
    OP_CMP_GE_F     = 0x55,

    OP_JMP          = 0x60,
    OP_JZ           = 0x61,
    OP_JNZ          = 0x62,

    OP_PRINT_I      = 0x70,
    OP_PRINT_F      = 0x71,
    OP_PRINT_NL     = 0x72,

    OP_HALT         = 0xFF
} OpCode;

typedef struct {
    uint8_t *code;
    size_t code_size;
    size_t code_capacity;

    Value *constants;
    size_t constant_count;
    size_t constant_capacity;

    uint32_t locals_count;
    uint32_t entry_point;
} BytecodeChunk;

BytecodeChunk *bytecode_chunk_new(void);
void bytecode_chunk_free(BytecodeChunk *chunk);
size_t bytecode_chunk_add_const(BytecodeChunk *chunk, Value val);
void bytecode_chunk_emit_byte(BytecodeChunk *chunk, uint8_t byte);
void bytecode_chunk_emit_u16(BytecodeChunk *chunk, uint16_t val);
void bytecode_chunk_emit_i32(BytecodeChunk *chunk, int32_t val);
void bytecode_chunk_emit_i64(BytecodeChunk *chunk, int64_t val);
void bytecode_chunk_patch_i32(BytecodeChunk *chunk, size_t offset, int32_t val);

#endif
