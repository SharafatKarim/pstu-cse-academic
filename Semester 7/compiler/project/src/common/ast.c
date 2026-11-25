#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ast.h"

static char *my_strdup(const char *s) {
    if (!s) return NULL;
    size_t len = strlen(s) + 1;
    char *dup = (char *)malloc(len);
    if (dup) memcpy(dup, s, len);
    return dup;
}

static ASTNode *ast_alloc(ASTNodeType type, int line, int col) {
    ASTNode *node = (ASTNode *)calloc(1, sizeof(ASTNode));
    if (!node) {
        fprintf(stderr, "Fatal error: out of memory allocating ASTNode\n");
        exit(1);
    }
    node->type = type;
    node->data_type = TYPE_UNKNOWN;
    node->line = line;
    node->col = col;
    return node;
}

ASTNode *ast_new_program(ASTNode *func_def) {
    ASTNode *n = ast_alloc(NODE_PROGRAM, func_def ? func_def->line : 1, func_def ? func_def->col : 1);
    n->as.program.func = func_def;
    return n;
}

ASTNode *ast_new_literal_int(int64_t val, int line, int col) {
    ASTNode *n = ast_alloc(NODE_LITERAL_INT, line, col);
    n->data_type = TYPE_INT;
    n->as.lit_int.val = val;
    return n;
}

ASTNode *ast_new_literal_float(double val, int line, int col) {
    ASTNode *n = ast_alloc(NODE_LITERAL_FLOAT, line, col);
    n->data_type = TYPE_FLOAT;
    n->as.lit_float.val = val;
    return n;
}

ASTNode *ast_new_var(const char *name, int line, int col) {
    ASTNode *n = ast_alloc(NODE_VAR, line, col);
    n->as.var.name = my_strdup(name);
    n->as.var.slot = -1;
    return n;
}

ASTNode *ast_new_binary_op(int op, ASTNode *left, ASTNode *right, int line, int col) {
    ASTNode *n = ast_alloc(NODE_BINARY_OP, line, col);
    n->as.binary.op = op;
    n->as.binary.left = left;
    n->as.binary.right = right;
    return n;
}

ASTNode *ast_new_unary_op(int op, ASTNode *operand, int line, int col) {
    ASTNode *n = ast_alloc(NODE_UNARY_OP, line, col);
    n->as.unary.op = op;
    n->as.unary.operand = operand;
    return n;
}

ASTNode *ast_new_decl(const char *name, DataType declared_type, ASTNode *init_expr, int line, int col) {
    ASTNode *n = ast_alloc(NODE_DECL, line, col);
    n->data_type = declared_type;
    n->as.decl.name = my_strdup(name);
    n->as.decl.declared_type = declared_type;
    n->as.decl.init_expr = init_expr;
    n->as.decl.slot = -1;
    return n;
}

ASTNode *ast_new_assign(const char *name, ASTNode *rhs, int line, int col) {
    ASTNode *n = ast_alloc(NODE_ASSIGN, line, col);
    n->as.assign.name = my_strdup(name);
    n->as.assign.rhs = rhs;
    n->as.assign.slot = -1;
    return n;
}

ASTNode *ast_new_if(ASTNode *cond, ASTNode *then_branch, ASTNode *else_branch, int line, int col) {
    ASTNode *n = ast_alloc(NODE_IF, line, col);
    n->as.if_stmt.cond = cond;
    n->as.if_stmt.then_branch = then_branch;
    n->as.if_stmt.else_branch = else_branch;
    return n;
}

ASTNode *ast_new_while(ASTNode *cond, ASTNode *body, int line, int col) {
    ASTNode *n = ast_alloc(NODE_WHILE, line, col);
    n->as.while_stmt.cond = cond;
    n->as.while_stmt.body = body;
    return n;
}

ASTNode *ast_new_return(ASTNode *expr, int line, int col) {
    ASTNode *n = ast_alloc(NODE_RETURN, line, col);
    n->as.return_stmt.expr = expr;
    return n;
}

ASTNode *ast_new_print(ASTNode *expr, bool newline, int line, int col) {
    ASTNode *n = ast_alloc(NODE_PRINT, line, col);
    n->as.print_stmt.expr = expr;
    n->as.print_stmt.newline = newline;
    return n;
}

ASTNode *ast_new_block(int line, int col) {
    ASTNode *n = ast_alloc(NODE_BLOCK, line, col);
    n->as.block.count = 0;
    n->as.block.capacity = 4;
    n->as.block.stmts = (ASTNode **)malloc(sizeof(ASTNode *) * n->as.block.capacity);
    return n;
}

void ast_block_append(ASTNode *block, ASTNode *stmt) {
    if (!block || block->type != NODE_BLOCK || !stmt) return;
    if (block->as.block.count >= block->as.block.capacity) {
        block->as.block.capacity *= 2;
        block->as.block.stmts = (ASTNode **)realloc(block->as.block.stmts, sizeof(ASTNode *) * block->as.block.capacity);
    }
    block->as.block.stmts[block->as.block.count++] = stmt;
}

ASTNode *ast_new_func_def(const char *name, ASTNode *body, int line, int col) {
    ASTNode *n = ast_alloc(NODE_FUNC_DEF, line, col);
    n->data_type = TYPE_INT;
    n->as.func.name = my_strdup(name);
    n->as.func.body = body;
    return n;
}

ASTNode *ast_new_cast_i2f(ASTNode *expr) {
    if (!expr) return NULL;
    ASTNode *n = ast_alloc(NODE_CAST_I2F, expr->line, expr->col);
    n->data_type = TYPE_FLOAT;
    n->as.cast.expr = expr;
    return n;
}

static const char *type_to_str(DataType t) {
    switch (t) {
        case TYPE_INT: return "int";
        case TYPE_FLOAT: return "float";
        case TYPE_VOID: return "void";
        default: return "unknown";
    }
}

static const char *op_to_str(int op) {
    switch (op) {
        case '+': return "+";
        case '-': return "-";
        case '*': return "*";
        case '/': return "/";
        case '!': return "!";
        case 258: return "==";
        case 259: return "!=";
        case 260: return "<=";
        case 261: return ">=";
        case '<': return "<";
        case '>': return ">";
        default: return "?";
    }
}

static void print_indent(int indent) {
    for (int i = 0; i < indent; i++) printf("  ");
}

void ast_print(const ASTNode *node, int indent) {
    if (!node) return;
    print_indent(indent);

    switch (node->type) {
        case NODE_PROGRAM:
            printf("Program (line %d)\n", node->line);
            ast_print(node->as.program.func, indent + 1);
            break;
        case NODE_FUNC_DEF:
            printf("FuncDef %s : %s (line %d)\n", node->as.func.name, type_to_str(node->data_type), node->line);
            ast_print(node->as.func.body, indent + 1);
            break;
        case NODE_BLOCK:
            printf("Block (%d stmts, line %d)\n", node->as.block.count, node->line);
            for (int i = 0; i < node->as.block.count; i++) {
                ast_print(node->as.block.stmts[i], indent + 1);
            }
            break;
        case NODE_DECL:
            printf("Decl %s : %s [slot: %d] (line %d)\n", node->as.decl.name, type_to_str(node->as.decl.declared_type), node->as.decl.slot, node->line);
            if (node->as.decl.init_expr) {
                ast_print(node->as.decl.init_expr, indent + 1);
            }
            break;
        case NODE_ASSIGN:
            printf("Assign %s [slot: %d] (line %d)\n", node->as.assign.name, node->as.assign.slot, node->line);
            ast_print(node->as.assign.rhs, indent + 1);
            break;
        case NODE_IF:
            printf("If (line %d)\n", node->line);
            print_indent(indent + 1); printf("Condition:\n");
            ast_print(node->as.if_stmt.cond, indent + 2);
            print_indent(indent + 1); printf("Then:\n");
            ast_print(node->as.if_stmt.then_branch, indent + 2);
            if (node->as.if_stmt.else_branch) {
                print_indent(indent + 1); printf("Else:\n");
                ast_print(node->as.if_stmt.else_branch, indent + 2);
            }
            break;
        case NODE_WHILE:
            printf("While (line %d)\n", node->line);
            print_indent(indent + 1); printf("Condition:\n");
            ast_print(node->as.while_stmt.cond, indent + 2);
            print_indent(indent + 1); printf("Body:\n");
            ast_print(node->as.while_stmt.body, indent + 2);
            break;
        case NODE_RETURN:
            printf("Return (line %d)\n", node->line);
            if (node->as.return_stmt.expr) {
                ast_print(node->as.return_stmt.expr, indent + 1);
            }
            break;
        case NODE_PRINT:
            printf("%s (line %d)\n", node->as.print_stmt.newline ? "Println" : "Print", node->line);
            ast_print(node->as.print_stmt.expr, indent + 1);
            break;
        case NODE_BINARY_OP:
            printf("BinaryOp '%s' [type: %s] (line %d)\n", op_to_str(node->as.binary.op), type_to_str(node->data_type), node->line);
            ast_print(node->as.binary.left, indent + 1);
            ast_print(node->as.binary.right, indent + 1);
            break;
        case NODE_UNARY_OP:
            printf("UnaryOp '%s' [type: %s] (line %d)\n", op_to_str(node->as.unary.op), type_to_str(node->data_type), node->line);
            ast_print(node->as.unary.operand, indent + 1);
            break;
        case NODE_LITERAL_INT:
            printf("Int: %ld [type: %s] (line %d)\n", (long)node->as.lit_int.val, type_to_str(node->data_type), node->line);
            break;
        case NODE_LITERAL_FLOAT:
            printf("Float: %f [type: %s] (line %d)\n", node->as.lit_float.val, type_to_str(node->data_type), node->line);
            break;
        case NODE_VAR:
            printf("Var: %s [slot: %d, type: %s] (line %d)\n", node->as.var.name, node->as.var.slot, type_to_str(node->data_type), node->line);
            break;
        case NODE_CAST_I2F:
            printf("Cast I2F [type: %s] (line %d)\n", type_to_str(node->data_type), node->line);
            ast_print(node->as.cast.expr, indent + 1);
            break;
    }
}

void ast_free(ASTNode *node) {
    if (!node) return;
    switch (node->type) {
        case NODE_PROGRAM:
            ast_free(node->as.program.func);
            break;
        case NODE_FUNC_DEF:
            free(node->as.func.name);
            ast_free(node->as.func.body);
            break;
        case NODE_BLOCK:
            for (int i = 0; i < node->as.block.count; i++) {
                ast_free(node->as.block.stmts[i]);
            }
            free(node->as.block.stmts);
            break;
        case NODE_DECL:
            free(node->as.decl.name);
            ast_free(node->as.decl.init_expr);
            break;
        case NODE_ASSIGN:
            free(node->as.assign.name);
            ast_free(node->as.assign.rhs);
            break;
        case NODE_IF:
            ast_free(node->as.if_stmt.cond);
            ast_free(node->as.if_stmt.then_branch);
            ast_free(node->as.if_stmt.else_branch);
            break;
        case NODE_WHILE:
            ast_free(node->as.while_stmt.cond);
            ast_free(node->as.while_stmt.body);
            break;
        case NODE_RETURN:
            ast_free(node->as.return_stmt.expr);
            break;
        case NODE_PRINT:
            ast_free(node->as.print_stmt.expr);
            break;
        case NODE_BINARY_OP:
            ast_free(node->as.binary.left);
            ast_free(node->as.binary.right);
            break;
        case NODE_UNARY_OP:
            ast_free(node->as.unary.operand);
            break;
        case NODE_VAR:
            free(node->as.var.name);
            break;
        case NODE_LITERAL_INT:
        case NODE_LITERAL_FLOAT:
            break;
        case NODE_CAST_I2F:
            ast_free(node->as.cast.expr);
            break;
    }
    free(node);
}
