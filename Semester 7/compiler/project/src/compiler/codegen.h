#ifndef MINIC_CODEGEN_H
#define MINIC_CODEGEN_H

#include "../common/ast.h"
#include "../vm/bytecode.h"

BytecodeChunk *codegen_generate(const ASTNode *root, int total_locals);
bool codegen_write_file(const BytecodeChunk *chunk, const char *path);

#endif
