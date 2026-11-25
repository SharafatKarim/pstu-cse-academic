#include <stdio.h>
#include <assert.h>
#include "../common/ast.h"
#include "../compiler/symtab.h"
#include "../compiler/sema.h"

static ASTNode *make_program(ASTNode *body) {
    return ast_new_program(ast_new_func_def("main", body, 1, 1));
}

int main(void) {
    printf("=== Running Semantic Analysis Tests ===\n");

    // Test 1: Valid scoping and implicit cast: int a = 10; float b = a + 2.5;
    {
        ASTNode *block = ast_new_block(1, 1);
        ast_block_append(block, ast_new_decl("a", TYPE_INT, ast_new_literal_int(10, 1, 1), 1, 1));
        ASTNode *add_expr = ast_new_binary_op('+', ast_new_var("a", 2, 1), ast_new_literal_float(2.5, 2, 5), 2, 3);
        ast_block_append(block, ast_new_decl("b", TYPE_FLOAT, add_expr, 2, 1));

        ASTNode *prog = make_program(block);
        SemaResult res = sema_analyze(prog, false);
        assert(res.success == true);
        assert(res.total_locals == 2);
        // Verify AST_CAST_I2F was inserted for left operand 'a'
        ASTNode *decl_b = block->as.block.stmts[1];
        ASTNode *rhs = decl_b->as.decl.init_expr;
        assert(rhs->type == NODE_BINARY_OP);
        assert(rhs->data_type == TYPE_FLOAT);
        assert(rhs->as.binary.left->type == NODE_CAST_I2F);
        assert(rhs->as.binary.left->data_type == TYPE_FLOAT);
        ast_free(prog);
        printf("[PASS] Test 1: Valid declarations & implicit promotion (int -> float)\n");
    }

    // Test 2: Undeclared variable: x = 5;
    {
        ASTNode *block = ast_new_block(1, 1);
        ast_block_append(block, ast_new_assign("x", ast_new_literal_int(5, 1, 5), 1, 1));
        ASTNode *prog = make_program(block);
        SemaResult res = sema_analyze(prog, false);
        assert(res.success == false);
        ast_free(prog);
        printf("[PASS] Test 2: Caught undeclared variable 'x'\n");
    }

    // Test 3: Duplicate declaration in same scope: int x; int x;
    {
        ASTNode *block = ast_new_block(1, 1);
        ast_block_append(block, ast_new_decl("x", TYPE_INT, NULL, 1, 1));
        ast_block_append(block, ast_new_decl("x", TYPE_INT, NULL, 2, 1));
        ASTNode *prog = make_program(block);
        SemaResult res = sema_analyze(prog, false);
        assert(res.success == false);
        ast_free(prog);
        printf("[PASS] Test 3: Caught duplicate declaration in same scope\n");
    }

    // Test 4: Variable shadowing in nested block: int x = 1; { float x = 2.0; }
    {
        ASTNode *outer_block = ast_new_block(1, 1);
        ast_block_append(outer_block, ast_new_decl("x", TYPE_INT, ast_new_literal_int(1, 1, 9), 1, 1));

        ASTNode *inner_block = ast_new_block(2, 1);
        ast_block_append(inner_block, ast_new_decl("x", TYPE_FLOAT, ast_new_literal_float(2.0, 2, 11), 2, 1));
        ast_block_append(outer_block, inner_block);

        ASTNode *prog = make_program(outer_block);
        SemaResult res = sema_analyze(prog, false);
        assert(res.success == true);
        assert(res.total_locals == 2);
        ast_free(prog);
        printf("[PASS] Test 4: Variable shadowing in nested block\n");
    }

    printf("All sema tests passed successfully!\n");
    return 0;
}
