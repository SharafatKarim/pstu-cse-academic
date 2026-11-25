#include <stdio.h>
#include <assert.h>
#include "../common/ast.h"

extern int yyparse(void);
extern ASTNode *g_root;
extern void *yy_scan_string(const char *str);
extern void yylex_destroy(void);

int main(void) {
    const char *test_code = 
        "int main() {\n"
        "    int a = 10;\n"
        "    float b = 2.5;\n"
        "    if (a > 5) {\n"
        "        b = b * 2.0;\n"
        "    }\n"
        "    println(b);\n"
        "    return 0;\n"
        "}\n";

    yy_scan_string(test_code);
    int res = yyparse();
    assert(res == 0);
    assert(g_root != NULL);
    assert(g_root->type == NODE_PROGRAM);
    printf("Parser test passed! AST produced:\n");
    ast_print(g_root, 0);
    ast_free(g_root);
    yylex_destroy();
    return 0;
}
