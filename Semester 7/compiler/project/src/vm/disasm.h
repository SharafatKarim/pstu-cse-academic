#ifndef MINIC_DISASM_H
#define MINIC_DISASM_H

#include <stdio.h>
#include "bytecode.h"

void disasm_chunk(const BytecodeChunk *chunk, FILE *out);
size_t disasm_instruction(const BytecodeChunk *chunk, size_t offset, FILE *out);

#endif
