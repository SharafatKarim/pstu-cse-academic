%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ast.h"

int yylex(void);
void yyerror(const char *s);

ASTNode *g_root = NULL;
%}

%locations
%define parse.error verbose

%union {
    ASTNode *node;
    char *str;
    int64_t int_val;
    double float_val;
    int type_spec;
}

%token <str> IDENTIFIER
%token <int_val> NUM_INT
%token <float_val> NUM_FLOAT

%token INT FLOAT
%token IF ELSE WHILE RETURN PRINT PRINTLN
%token EQ NE LE GE

%type <node> program func_def block stmt_list stmt
%type <node> decl_stmt assign_stmt if_stmt while_stmt return_stmt print_stmt expr
%type <type_spec> type_spec

%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%left EQ NE
%left '<' '>' LE GE
%left '+' '-'
%left '*' '/'
%right '!' UMINUS

%%

program:
    func_def                { g_root = ast_new_program($1); $$ = g_root; }
    ;

func_def:
    type_spec IDENTIFIER '(' ')' block {
        $$ = ast_new_func_def($2, $5, @2.first_line, @2.first_column);
        $$->data_type = (DataType)$1;
        free($2);
    }
    ;

block:
    '{' stmt_list '}'       { $$ = $2; }
    ;

stmt_list:
    /* empty */             { $$ = ast_new_block(@$.first_line, @$.first_column); }
    | stmt_list stmt        {
        if ($2) ast_block_append($1, $2);
        $$ = $1;
    }
    ;

stmt:
    decl_stmt               { $$ = $1; }
    | assign_stmt           { $$ = $1; }
    | if_stmt               { $$ = $1; }
    | while_stmt            { $$ = $1; }
    | return_stmt           { $$ = $1; }
    | print_stmt            { $$ = $1; }
    | block                 { $$ = $1; }
    | ';'                   { $$ = NULL; }
    ;

type_spec:
    INT                     { $$ = TYPE_INT; }
    | FLOAT                 { $$ = TYPE_FLOAT; }
    ;

decl_stmt:
    type_spec IDENTIFIER ';' {
        $$ = ast_new_decl($2, (DataType)$1, NULL, @2.first_line, @2.first_column);
        free($2);
    }
    | type_spec IDENTIFIER '=' expr ';' {
        $$ = ast_new_decl($2, (DataType)$1, $4, @2.first_line, @2.first_column);
        free($2);
    }
    ;

assign_stmt:
    IDENTIFIER '=' expr ';' {
        $$ = ast_new_assign($1, $3, @1.first_line, @1.first_column);
        free($1);
    }
    ;

if_stmt:
    IF '(' expr ')' stmt %prec LOWER_THAN_ELSE {
        $$ = ast_new_if($3, $5, NULL, @1.first_line, @1.first_column);
    }
    | IF '(' expr ')' stmt ELSE stmt {
        $$ = ast_new_if($3, $5, $7, @1.first_line, @1.first_column);
    }
    ;

while_stmt:
    WHILE '(' expr ')' stmt {
        $$ = ast_new_while($3, $5, @1.first_line, @1.first_column);
    }
    ;

return_stmt:
    RETURN expr ';'         { $$ = ast_new_return($2, @1.first_line, @1.first_column); }
    | RETURN ';'            { $$ = ast_new_return(NULL, @1.first_line, @1.first_column); }
    ;

print_stmt:
    PRINT '(' expr ')' ';'   { $$ = ast_new_print($3, false, @1.first_line, @1.first_column); }
    | PRINTLN '(' expr ')' ';' { $$ = ast_new_print($3, true, @1.first_line, @1.first_column); }
    ;

expr:
    IDENTIFIER              { $$ = ast_new_var($1, @1.first_line, @1.first_column); free($1); }
    | NUM_INT               { $$ = ast_new_literal_int($1, @1.first_line, @1.first_column); }
    | NUM_FLOAT             { $$ = ast_new_literal_float($1, @1.first_line, @1.first_column); }
    | expr '+' expr         { $$ = ast_new_binary_op('+', $1, $3, @2.first_line, @2.first_column); }
    | expr '-' expr         { $$ = ast_new_binary_op('-', $1, $3, @2.first_line, @2.first_column); }
    | expr '*' expr         { $$ = ast_new_binary_op('*', $1, $3, @2.first_line, @2.first_column); }
    | expr '/' expr         { $$ = ast_new_binary_op('/', $1, $3, @2.first_line, @2.first_column); }
    | expr EQ expr          { $$ = ast_new_binary_op(EQ, $1, $3, @2.first_line, @2.first_column); }
    | expr NE expr          { $$ = ast_new_binary_op(NE, $1, $3, @2.first_line, @2.first_column); }
    | expr '<' expr         { $$ = ast_new_binary_op('<', $1, $3, @2.first_line, @2.first_column); }
    | expr '>' expr         { $$ = ast_new_binary_op('>', $1, $3, @2.first_line, @2.first_column); }
    | expr LE expr          { $$ = ast_new_binary_op(LE, $1, $3, @2.first_line, @2.first_column); }
    | expr GE expr          { $$ = ast_new_binary_op(GE, $1, $3, @2.first_line, @2.first_column); }
    | '-' expr %prec UMINUS { $$ = ast_new_unary_op('-', $2, @1.first_line, @1.first_column); }
    | '!' expr              { $$ = ast_new_unary_op('!', $2, @1.first_line, @1.first_column); }
    | '(' expr ')'          { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax Error [%d:%d]: %s\n", yylloc.first_line, yylloc.first_column, s);
}
