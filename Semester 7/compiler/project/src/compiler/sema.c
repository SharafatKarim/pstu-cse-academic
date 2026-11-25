#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sema.h"

typedef struct {
    SymbolTable *st;
    int error_count;
    bool verbose;
} SemaContext;

static void sema_error(SemaContext *ctx, int line, int col, const char *msg, const char *arg) {
    ctx->error_count++;
    if (arg) {
        fprintf(stderr, "Semantic Error [%d:%d]: %s '%s'\n", line, col, msg, arg);
    } else {
        fprintf(stderr, "Semantic Error [%d:%d]: %s\n", line, col, msg);
    }
}

static void analyze_expr(SemaContext *ctx, ASTNode **node_ptr);
static void analyze_stmt(SemaContext *ctx, ASTNode *node);

static void analyze_expr(SemaContext *ctx, ASTNode **node_ptr) {
    if (!node_ptr || !*node_ptr) return;
    ASTNode *node = *node_ptr;

    switch (node->type) {
        case NODE_LITERAL_INT:
            node->data_type = TYPE_INT;
            break;

        case NODE_LITERAL_FLOAT:
            node->data_type = TYPE_FLOAT;
            break;

        case NODE_VAR: {
            Symbol *sym = symtab_lookup(ctx->st, node->as.var.name);
            if (!sym) {
                sema_error(ctx, node->line, node->col, "undeclared variable", node->as.var.name);
                node->data_type = TYPE_UNKNOWN;
                node->as.var.slot = -1;
            } else {
                node->data_type = sym->type;
                node->as.var.slot = sym->local_slot;
            }
            break;
        }

        case NODE_BINARY_OP: {
            analyze_expr(ctx, &node->as.binary.left);
            analyze_expr(ctx, &node->as.binary.right);

            DataType lt = node->as.binary.left->data_type;
            DataType rt = node->as.binary.right->data_type;

            if (lt == TYPE_UNKNOWN || rt == TYPE_UNKNOWN) {
                node->data_type = TYPE_UNKNOWN;
                return;
            }

            int op = node->as.binary.op;
            bool is_rel = (op == '<' || op == '>' || op == 258 /* EQ */ ||
                           op == 259 /* NE */ || op == 260 /* LE */ || op == 261 /* GE */);

            if (is_rel) {
                // Promote if mixed
                if (lt == TYPE_INT && rt == TYPE_FLOAT) {
                    node->as.binary.left = ast_new_cast_i2f(node->as.binary.left);
                } else if (lt == TYPE_FLOAT && rt == TYPE_INT) {
                    node->as.binary.right = ast_new_cast_i2f(node->as.binary.right);
                }
                node->data_type = TYPE_INT; // Relational returns 0 or 1 (boolean int)
            } else {
                // Arithmetic
                if (lt == TYPE_INT && rt == TYPE_INT) {
                    node->data_type = TYPE_INT;
                } else if (lt == TYPE_FLOAT && rt == TYPE_FLOAT) {
                    node->data_type = TYPE_FLOAT;
                } else if (lt == TYPE_INT && rt == TYPE_FLOAT) {
                    node->as.binary.left = ast_new_cast_i2f(node->as.binary.left);
                    node->data_type = TYPE_FLOAT;
                } else if (lt == TYPE_FLOAT && rt == TYPE_INT) {
                    node->as.binary.right = ast_new_cast_i2f(node->as.binary.right);
                    node->data_type = TYPE_FLOAT;
                }
            }
            break;
        }

        case NODE_UNARY_OP: {
            analyze_expr(ctx, &node->as.unary.operand);
            node->data_type = node->as.unary.operand->data_type;
            break;
        }

        case NODE_CAST_I2F: {
            analyze_expr(ctx, &node->as.cast.expr);
            node->data_type = TYPE_FLOAT;
            break;
        }

        default:
            break;
    }
}

static void analyze_stmt(SemaContext *ctx, ASTNode *node) {
    if (!node) return;

    switch (node->type) {
        case NODE_BLOCK: {
            symtab_enter_scope(ctx->st);
            for (int i = 0; i < node->as.block.count; i++) {
                analyze_stmt(ctx, node->as.block.stmts[i]);
            }
            symtab_leave_scope(ctx->st);
            break;
        }

        case NODE_DECL: {
            if (symtab_lookup_current(ctx->st, node->as.decl.name)) {
                sema_error(ctx, node->line, node->col, "duplicate declaration of variable in same scope", node->as.decl.name);
                return;
            }

            if (node->as.decl.init_expr) {
                analyze_expr(ctx, &node->as.decl.init_expr);
                DataType init_type = node->as.decl.init_expr->data_type;
                if (node->as.decl.declared_type == TYPE_FLOAT && init_type == TYPE_INT) {
                    node->as.decl.init_expr = ast_new_cast_i2f(node->as.decl.init_expr);
                } else if (node->as.decl.declared_type == TYPE_INT && init_type == TYPE_FLOAT) {
                    sema_error(ctx, node->line, node->col, "cannot implicitly assign float to int variable", node->as.decl.name);
                }
            }

            Symbol *sym = symtab_add(ctx->st, node->as.decl.name, node->as.decl.declared_type, node->line, node->col);
            node->as.decl.slot = sym->local_slot;
            node->data_type = sym->type;
            break;
        }

        case NODE_ASSIGN: {
            Symbol *sym = symtab_lookup(ctx->st, node->as.assign.name);
            if (!sym) {
                sema_error(ctx, node->line, node->col, "assignment to undeclared variable", node->as.assign.name);
                return;
            }

            analyze_expr(ctx, &node->as.assign.rhs);
            DataType rhs_type = node->as.assign.rhs->data_type;
            if (sym->type == TYPE_FLOAT && rhs_type == TYPE_INT) {
                node->as.assign.rhs = ast_new_cast_i2f(node->as.assign.rhs);
            } else if (sym->type == TYPE_INT && rhs_type == TYPE_FLOAT) {
                sema_error(ctx, node->line, node->col, "cannot assign float expression to int variable", sym->name);
            }

            node->as.assign.slot = sym->local_slot;
            node->data_type = sym->type;
            break;
        }

        case NODE_IF: {
            analyze_expr(ctx, &node->as.if_stmt.cond);
            analyze_stmt(ctx, node->as.if_stmt.then_branch);
            if (node->as.if_stmt.else_branch) {
                analyze_stmt(ctx, node->as.if_stmt.else_branch);
            }
            break;
        }

        case NODE_WHILE: {
            analyze_expr(ctx, &node->as.while_stmt.cond);
            analyze_stmt(ctx, node->as.while_stmt.body);
            break;
        }

        case NODE_RETURN: {
            if (node->as.return_stmt.expr) {
                analyze_expr(ctx, &node->as.return_stmt.expr);
            }
            break;
        }

        case NODE_PRINT: {
            analyze_expr(ctx, &node->as.print_stmt.expr);
            break;
        }

        default:
            break;
    }
}

SemaResult sema_analyze(ASTNode *root, bool verbose) {
    SemaResult res = { .success = false, .total_locals = 0, .error_count = 0 };
    if (!root) return res;

    SemaContext ctx;
    ctx.st = symtab_new();
    ctx.error_count = 0;
    ctx.verbose = verbose;

    ASTNode *func = NULL;
    if (root->type == NODE_PROGRAM) {
        func = root->as.program.func;
    } else if (root->type == NODE_FUNC_DEF) {
        func = root;
    }

    if (func && func->type == NODE_FUNC_DEF) {
        analyze_stmt(&ctx, func->as.func.body);
    }

    if (verbose) {
        symtab_dump(ctx.st);
    }

    res.total_locals = ctx.st->total_slots;
    res.error_count = ctx.error_count;
    res.success = (ctx.error_count == 0);

    symtab_free(ctx.st);
    return res;
}
