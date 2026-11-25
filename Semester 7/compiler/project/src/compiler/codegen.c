#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "codegen.h"

static void codegen_expr(BytecodeChunk *chunk, const ASTNode *node);
static void codegen_stmt(BytecodeChunk *chunk, const ASTNode *node);

static void codegen_expr(BytecodeChunk *chunk, const ASTNode *node) {
    if (!node) return;

    switch (node->type) {
        case NODE_LITERAL_INT:
            bytecode_chunk_emit_byte(chunk, OP_PUSH_I);
            bytecode_chunk_emit_i64(chunk, node->as.lit_int.val);
            break;

        case NODE_LITERAL_FLOAT: {
            Value v;
            v.f = node->as.lit_float.val;
            size_t idx = bytecode_chunk_add_const(chunk, v);
            bytecode_chunk_emit_byte(chunk, OP_PUSH_CONST);
            bytecode_chunk_emit_u16(chunk, (uint16_t)idx);
            break;
        }

        case NODE_VAR:
            bytecode_chunk_emit_byte(chunk, OP_LOAD_LOCAL);
            bytecode_chunk_emit_u16(chunk, (uint16_t)node->as.var.slot);
            break;

        case NODE_CAST_I2F:
            codegen_expr(chunk, node->as.cast.expr);
            bytecode_chunk_emit_byte(chunk, OP_I2F);
            break;

        case NODE_UNARY_OP:
            codegen_expr(chunk, node->as.unary.operand);
            if (node->as.unary.op == '-') {
                bytecode_chunk_emit_byte(chunk, (node->data_type == TYPE_FLOAT) ? OP_NEG_F : OP_NEG_I);
            } else if (node->as.unary.op == '!') {
                // !expr is (expr == 0)
                bytecode_chunk_emit_byte(chunk, OP_PUSH_I);
                bytecode_chunk_emit_i64(chunk, 0);
                bytecode_chunk_emit_byte(chunk, OP_CMP_EQ_I);
            }
            break;

        case NODE_BINARY_OP: {
            codegen_expr(chunk, node->as.binary.left);
            codegen_expr(chunk, node->as.binary.right);

            bool is_float = (node->as.binary.left->data_type == TYPE_FLOAT ||
                             node->as.binary.right->data_type == TYPE_FLOAT);

            switch (node->as.binary.op) {
                case '+':
                    bytecode_chunk_emit_byte(chunk, is_float ? OP_ADD_F : OP_ADD_I);
                    break;
                case '-':
                    bytecode_chunk_emit_byte(chunk, is_float ? OP_SUB_F : OP_SUB_I);
                    break;
                case '*':
                    bytecode_chunk_emit_byte(chunk, is_float ? OP_MUL_F : OP_MUL_I);
                    break;
                case '/':
                    bytecode_chunk_emit_byte(chunk, is_float ? OP_DIV_F : OP_DIV_I);
                    break;
                case 258: /* EQ */
                    bytecode_chunk_emit_byte(chunk, is_float ? OP_CMP_EQ_F : OP_CMP_EQ_I);
                    break;
                case 259: /* NE */
                    bytecode_chunk_emit_byte(chunk, is_float ? OP_CMP_NE_F : OP_CMP_NE_I);
                    break;
                case '<':
                    bytecode_chunk_emit_byte(chunk, is_float ? OP_CMP_LT_F : OP_CMP_LT_I);
                    break;
                case '>':
                    bytecode_chunk_emit_byte(chunk, is_float ? OP_CMP_GT_F : OP_CMP_GT_I);
                    break;
                case 260: /* LE */
                    bytecode_chunk_emit_byte(chunk, is_float ? OP_CMP_LE_F : OP_CMP_LE_I);
                    break;
                case 261: /* GE */
                    bytecode_chunk_emit_byte(chunk, is_float ? OP_CMP_GE_F : OP_CMP_GE_I);
                    break;
                default:
                    fprintf(stderr, "Unknown binary operator: %d\n", node->as.binary.op);
                    break;
            }
            break;
        }

        default:
            break;
    }
}

static void codegen_stmt(BytecodeChunk *chunk, const ASTNode *node) {
    if (!node) return;

    switch (node->type) {
        case NODE_BLOCK:
            for (int i = 0; i < node->as.block.count; i++) {
                codegen_stmt(chunk, node->as.block.stmts[i]);
            }
            break;

        case NODE_DECL:
            if (node->as.decl.init_expr) {
                codegen_expr(chunk, node->as.decl.init_expr);
            } else {
                bytecode_chunk_emit_byte(chunk, OP_PUSH_I);
                bytecode_chunk_emit_i64(chunk, 0);
                if (node->as.decl.declared_type == TYPE_FLOAT) {
                    bytecode_chunk_emit_byte(chunk, OP_I2F);
                }
            }
            bytecode_chunk_emit_byte(chunk, OP_STORE_LOCAL);
            bytecode_chunk_emit_u16(chunk, (uint16_t)node->as.decl.slot);
            break;

        case NODE_ASSIGN:
            codegen_expr(chunk, node->as.assign.rhs);
            bytecode_chunk_emit_byte(chunk, OP_STORE_LOCAL);
            bytecode_chunk_emit_u16(chunk, (uint16_t)node->as.assign.slot);
            break;

        case NODE_IF: {
            codegen_expr(chunk, node->as.if_stmt.cond);
            bytecode_chunk_emit_byte(chunk, OP_JZ);
            size_t patch_then = chunk->code_size;
            bytecode_chunk_emit_i32(chunk, 0);

            codegen_stmt(chunk, node->as.if_stmt.then_branch);

            if (node->as.if_stmt.else_branch) {
                bytecode_chunk_emit_byte(chunk, OP_JMP);
                size_t patch_else = chunk->code_size;
                bytecode_chunk_emit_i32(chunk, 0);

                int32_t rel_then = (int32_t)(chunk->code_size - (patch_then + 4));
                bytecode_chunk_patch_i32(chunk, patch_then, rel_then);

                codegen_stmt(chunk, node->as.if_stmt.else_branch);

                int32_t rel_else = (int32_t)(chunk->code_size - (patch_else + 4));
                bytecode_chunk_patch_i32(chunk, patch_else, rel_else);
            } else {
                int32_t rel_then = (int32_t)(chunk->code_size - (patch_then + 4));
                bytecode_chunk_patch_i32(chunk, patch_then, rel_then);
            }
            break;
        }

        case NODE_WHILE: {
            size_t loop_start = chunk->code_size;
            codegen_expr(chunk, node->as.while_stmt.cond);
            bytecode_chunk_emit_byte(chunk, OP_JZ);
            size_t patch_exit = chunk->code_size;
            bytecode_chunk_emit_i32(chunk, 0);

            codegen_stmt(chunk, node->as.while_stmt.body);

            bytecode_chunk_emit_byte(chunk, OP_JMP);
            int32_t rel_loop = (int32_t)((int64_t)loop_start - (int64_t)(chunk->code_size + 4));
            bytecode_chunk_emit_i32(chunk, rel_loop);

            int32_t rel_exit = (int32_t)(chunk->code_size - (patch_exit + 4));
            bytecode_chunk_patch_i32(chunk, patch_exit, rel_exit);
            break;
        }

        case NODE_RETURN:
            if (node->as.return_stmt.expr) {
                codegen_expr(chunk, node->as.return_stmt.expr);
            } else {
                bytecode_chunk_emit_byte(chunk, OP_PUSH_I);
                bytecode_chunk_emit_i64(chunk, 0);
            }
            bytecode_chunk_emit_byte(chunk, OP_HALT);
            break;

        case NODE_PRINT:
            codegen_expr(chunk, node->as.print_stmt.expr);
            if (node->as.print_stmt.expr->data_type == TYPE_FLOAT) {
                bytecode_chunk_emit_byte(chunk, OP_PRINT_F);
            } else {
                bytecode_chunk_emit_byte(chunk, OP_PRINT_I);
            }
            if (node->as.print_stmt.newline) {
                bytecode_chunk_emit_byte(chunk, OP_PRINT_NL);
            }
            break;

        default:
            break;
    }
}

BytecodeChunk *codegen_generate(const ASTNode *root, int total_locals) {
    if (!root) return NULL;
    BytecodeChunk *chunk = bytecode_chunk_new();
    chunk->locals_count = (uint32_t)total_locals;
    chunk->entry_point = 0;

    const ASTNode *func = NULL;
    if (root->type == NODE_PROGRAM) {
        func = root->as.program.func;
    } else if (root->type == NODE_FUNC_DEF) {
        func = root;
    }

    if (func && func->type == NODE_FUNC_DEF) {
        codegen_stmt(chunk, func->as.func.body);
    }

    // Ensure program halts cleanly if no return statement was reached
    if (chunk->code_size == 0 || chunk->code[chunk->code_size - 1] != OP_HALT) {
        bytecode_chunk_emit_byte(chunk, OP_PUSH_I);
        bytecode_chunk_emit_i64(chunk, 0);
        bytecode_chunk_emit_byte(chunk, OP_HALT);
    }

    return chunk;
}

bool codegen_write_file(const BytecodeChunk *chunk, const char *path) {
    if (!chunk || !path) return false;

    FILE *f = fopen(path, "wb");
    if (!f) {
        perror("Failed to open file for writing bytecode");
        return false;
    }

    MBCHeader header;
    memcpy(header.magic, MBC_MAGIC, 4);
    header.version = MBC_VERSION;
    header.flags = 0;
    header.constant_count = (uint32_t)chunk->constant_count;
    header.code_size = (uint32_t)chunk->code_size;
    header.locals_count = chunk->locals_count;
    header.entry_point = chunk->entry_point;

    if (fwrite(&header, sizeof(MBCHeader), 1, f) != 1) {
        fclose(f);
        return false;
    }

    // Write constant pool entries
    for (size_t i = 0; i < chunk->constant_count; i++) {
        uint8_t tag = CONST_TAG_FLOAT;
        if (fwrite(&tag, 1, 1, f) != 1 ||
            fwrite(&chunk->constants[i].f, sizeof(double), 1, f) != 1) {
            fclose(f);
            return false;
        }
    }

    // Write code stream
    if (chunk->code_size > 0) {
        if (fwrite(chunk->code, 1, chunk->code_size, f) != chunk->code_size) {
            fclose(f);
            return false;
        }
    }

    fclose(f);
    return true;
}
