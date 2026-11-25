#include <stdio.h>
#include <assert.h>
#include "../common/value.h"
#include "../common/ast.h"

int main(void) {
    ASTNode *lit1 = ast_new_literal_int(42, 1, 1);
    assert(lit1 != NULL);
    assert(lit1->type == NODE_LITERAL_INT);
    assert(lit1->as.lit_int.val == 42);

    ASTNode *lit2 = ast_new_literal_float(3.14, 1, 5);
    assert(lit2 != NULL);
    assert(lit2->type == NODE_LITERAL_FLOAT);
    assert(lit2->as.lit_float.val > 3.13 && lit2->as.lit_float.val < 3.15);

    ASTNode *add = ast_new_binary_op('+', lit1, lit2, 1, 3);
    assert(add != NULL);
    assert(add->type == NODE_BINARY_OP);
    assert(add->as.binary.left == lit1);
    assert(add->as.binary.right == lit2);

    ast_print(add, 0);
    ast_free(add);
    printf("test_ast passed successfully.\n");
    return 0;
}
