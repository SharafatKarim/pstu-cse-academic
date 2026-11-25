#ifndef MINIC_AST_H
#define MINIC_AST_H

#include <stdint.h>
#include <stdbool.h>
#include "value.h"

typedef enum {
    NODE_PROGRAM,
    NODE_FUNC_DEF,
    NODE_BLOCK,
    NODE_DECL,
    NODE_ASSIGN,
    NODE_IF,
    NODE_WHILE,
    NODE_RETURN,
    NODE_PRINT,
    NODE_BINARY_OP,
    NODE_UNARY_OP,
    NODE_LITERAL_INT,
    NODE_LITERAL_FLOAT,
    NODE_VAR,
    NODE_CAST_I2F
} ASTNodeType;

typedef struct ASTNode {
    ASTNodeType type;
    DataType data_type;
    int line;
    int col;
    union {
        struct { struct ASTNode *func; } program;
        struct { char *name; struct ASTNode *body; } func;
        struct { struct ASTNode **stmts; int count; int capacity; } block;
        struct { char *name; DataType declared_type; struct ASTNode *init_expr; int slot; } decl;
        struct { char *name; struct ASTNode *rhs; int slot; } assign;
        struct { struct ASTNode *cond; struct ASTNode *then_branch; struct ASTNode *else_branch; } if_stmt;
        struct { struct ASTNode *cond; struct ASTNode *body; } while_stmt;
        struct { struct ASTNode *expr; } return_stmt;
        struct { struct ASTNode *expr; bool newline; } print_stmt;
        struct { int op; struct ASTNode *left; struct ASTNode *right; } binary;
        struct { int op; struct ASTNode *operand; } unary;
        struct { char *name; int slot; } var;
        struct { int64_t val; } lit_int;
        struct { double val; } lit_float;
        struct { struct ASTNode *expr; } cast;
    } as;
} ASTNode;

ASTNode *ast_new_program(ASTNode *func_def);
ASTNode *ast_new_literal_int(int64_t val, int line, int col);
ASTNode *ast_new_literal_float(double val, int line, int col);
ASTNode *ast_new_var(const char *name, int line, int col);
ASTNode *ast_new_binary_op(int op, ASTNode *left, ASTNode *right, int line, int col);
ASTNode *ast_new_unary_op(int op, ASTNode *operand, int line, int col);
ASTNode *ast_new_decl(const char *name, DataType declared_type, ASTNode *init_expr, int line, int col);
ASTNode *ast_new_assign(const char *name, ASTNode *rhs, int line, int col);
ASTNode *ast_new_if(ASTNode *cond, ASTNode *then_branch, ASTNode *else_branch, int line, int col);
ASTNode *ast_new_while(ASTNode *cond, ASTNode *body, int line, int col);
ASTNode *ast_new_return(ASTNode *expr, int line, int col);
ASTNode *ast_new_print(ASTNode *expr, bool newline, int line, int col);
ASTNode *ast_new_block(int line, int col);
void ast_block_append(ASTNode *block, ASTNode *stmt);
ASTNode *ast_new_func_def(const char *name, ASTNode *body, int line, int col);
ASTNode *ast_new_cast_i2f(ASTNode *expr);
void ast_print(const ASTNode *node, int indent);
void ast_free(ASTNode *node);

#endif
