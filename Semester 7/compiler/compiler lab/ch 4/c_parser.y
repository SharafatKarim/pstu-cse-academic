%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include "c_parser.tab.h"

typedef struct ASTNode {
    char *label;
    int num_children;
    struct ASTNode **children;
} ASTNode;

ASTNode *create_node(const char *label, int num_children, ...) {
    ASTNode *node = (ASTNode *)malloc(sizeof(ASTNode));
    node->label = strdup(label);
    node->num_children = num_children;
    if (num_children > 0) {
        node->children = (ASTNode **)malloc(sizeof(ASTNode *) * num_children);
        va_list args;
        va_start(args, num_children);
        for (int i = 0; i < num_children; i++) {
            node->children[i] = va_arg(args, ASTNode *);
        }
        va_end(args);
    } else {
        node->children = NULL;
    }
    return node;
}

void print_ast(ASTNode *node, int indent) {
    if (!node) return;
    for (int i = 0; i < indent; i++) printf("  ");
    printf("- %s\n", node->label);
    for (int i = 0; i < node->num_children; i++) {
        print_ast(node->children[i], indent + 1);
    }
}

int yylex(void);
void yyerror(const char *s);
ASTNode *root = NULL;
%}

%union {
    char *str;
    struct ASTNode *ast;
}

%token <str> IDENTIFIER NUM
%token IF ELSE WHILE RETURN
%token INT FLOAT
%token EQ NE LE GE LT GT

%type <ast> program stmt_list stmt decl_stmt assign_stmt if_stmt while_stmt return_stmt block expr

/* Resolve dangling-else: prefer shift (inner 'if') over reduce */
%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%left EQ NE LT GT LE GE
%left '+' '-'
%left '*' '/'

%%

program:
    stmt_list               { root = create_node("Program", 1, $1); }
    ;

stmt_list:
    stmt                    { $$ = create_node("StmtList", 1, $1); }
    | stmt_list stmt        { $$ = create_node("StmtList", 2, $1, $2); }
    ;

stmt:
    decl_stmt               { $$ = $1; }
    | assign_stmt           { $$ = $1; }
    | if_stmt               { $$ = $1; }
    | while_stmt            { $$ = $1; }
    | return_stmt           { $$ = $1; }
    | block                 { $$ = $1; }
    | error ';'             {
                                yyerrok;
                                printf(">> [Panic Recovery]: Syntax error recovered at ';'\n");
                                $$ = create_node("ErrorRecovered", 0);
                            }
    ;

decl_stmt:
    INT IDENTIFIER ';'      {
                                char buf[128];
                                snprintf(buf, sizeof(buf), "Decl(int %s)", $2);
                                $$ = create_node(buf, 0);
                                free($2);
                            }
    | INT IDENTIFIER '=' expr ';' {
                                char buf[128];
                                snprintf(buf, sizeof(buf), "DeclInit(int %s)", $2);
                                $$ = create_node(buf, 1, $4);
                                free($2);
                            }
    | FLOAT IDENTIFIER ';'  {
                                char buf[128];
                                snprintf(buf, sizeof(buf), "Decl(float %s)", $2);
                                $$ = create_node(buf, 0);
                                free($2);
                            }
    ;

assign_stmt:
    IDENTIFIER '=' expr ';' {
                                char buf[128];
                                snprintf(buf, sizeof(buf), "Assign(%s)", $1);
                                $$ = create_node(buf, 1, $3);
                                free($1);
                            }
    ;

if_stmt:
    IF '(' expr ')' stmt %prec LOWER_THAN_ELSE {
                                $$ = create_node("IfStmt", 2, $3, $5);
                            }
    | IF '(' expr ')' stmt ELSE stmt {
                                $$ = create_node("IfElseStmt", 3, $3, $5, $7);
                            }
    ;

while_stmt:
    WHILE '(' expr ')' stmt {
                                $$ = create_node("WhileStmt", 2, $3, $5);
                            }
    ;

return_stmt:
    RETURN expr ';'         { $$ = create_node("ReturnStmt", 1, $2); }
    ;

block:
    '{' stmt_list '}'       { $$ = create_node("Block", 1, $2); }
    ;

expr:
    IDENTIFIER              {
                                char buf[64];
                                snprintf(buf, sizeof(buf), "ID(%s)", $1);
                                $$ = create_node(buf, 0);
                                free($1);
                            }
    | NUM                   {
                                char buf[64];
                                snprintf(buf, sizeof(buf), "NUM(%s)", $1);
                                $$ = create_node(buf, 0);
                                free($1);
                            }
    | expr '+' expr         { $$ = create_node("Add(+)", 2, $1, $3); }
    | expr '-' expr         { $$ = create_node("Sub(-)", 2, $1, $3); }
    | expr '*' expr         { $$ = create_node("Mul(*)", 2, $1, $3); }
    | expr '/' expr         { $$ = create_node("Div(/)", 2, $1, $3); }
    | expr GT expr          { $$ = create_node("GT(>)", 2, $1, $3); }
    | expr LT expr          { $$ = create_node("LT(<)", 2, $1, $3); }
    | '(' expr ')'          { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax Error: %s\n", s);
}

static int tests_failed = 0;

static void check(int cond, const char *name) {
    printf("%s %s\n", cond ? "[PASS]" : "[FAIL]", name);
    if (!cond) tests_failed++;
}

static ASTNode *find_label(ASTNode *n, const char *needle) {
    if (!n) return NULL;
    if (strstr(n->label, needle)) return n;
    for (int i = 0; i < n->num_children; i++) {
        ASTNode *hit = find_label(n->children[i], needle);
        if (hit) return hit;
    }
    return NULL;
}

int main(void) {
    printf("=== Section 4.9: Mini-C Compiler Parser (Flex + Bison with AST) ===\n");
    printf("Enter C-subset code (Ctrl+D to parse):\n");
    if (yyparse() == 0 && root) {
        printf("\n[Abstract Syntax Tree (AST)]:\n");
        print_ast(root, 0);
    }

    /* runnable self-check, see reader mode via `make check` */
    if (root) {
        printf("\n[Self-check]:\n");
        if (find_label(root, "GT(>)"))
            check(find_label(root, "GT(>)")->children[0]->children == NULL, "comparison has no bogus INT child");
        if (find_label(root, "Assign("))
            check(find_label(root, "Assign(")->num_children == 1, "assignment has exactly one right-hand side");
        if (find_label(root, "IfElseStmt"))
            check(find_label(root, "IfElseStmt")->num_children == 3, "if-else keeps then/else branches");
        check(find_label(root, "Decl(") != NULL, "int declaration node present");
    } else {
        check(0, "parse produced a tree");
    }
    printf("%s\n", tests_failed ? "SELF-CHECK FAILED" : "SELF-CHECK OK");
    return tests_failed ? 1 : 0;
}
