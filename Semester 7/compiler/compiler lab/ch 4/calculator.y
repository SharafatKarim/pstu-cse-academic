%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Simple Symbol Table for Desktop Calculator */
struct Symbol {
    char name[64];
    double value;
};

static struct Symbol symtab[128];
static int sym_count = 0;

double get_var(const char *name) {
    for (int i = 0; i < sym_count; i++) {
        if (strcmp(symtab[i].name, name) == 0) {
            return symtab[i].value;
        }
    }
    printf("Warning: Undefined variable '%s', defaulting to 0\n", name);
    return 0.0;
}

void set_var(const char *name, double val) {
    for (int i = 0; i < sym_count; i++) {
        if (strcmp(symtab[i].name, name) == 0) {
            symtab[i].value = val;
            return;
        }
    }
    if (sym_count < 128) {
        strncpy(symtab[sym_count].name, name, 63);
        symtab[sym_count].value = val;
        sym_count++;
    }
}

int yylex(void);
void yyerror(const char *s);
%}

%union {
    double num;
    char *id;
}

%token <num> NUMBER
%token <id> VARIABLE
%type <num> expr

/* Precedence and Associativity declarations */
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%%

program:
    /* empty */
    | program line
    ;

line:
    '\n'
    | expr '\n'             { printf("Result = %g\n", $1); }
    | expr ';' '\n'         { printf("Result = %g\n", $1); }
    | VARIABLE '=' expr '\n' { 
                                set_var($1, $3); 
                                printf("%s = %g\n", $1, $3); 
                                free($1); 
                            }
    | VARIABLE '=' expr ';' '\n' { 
                                set_var($1, $3); 
                                printf("%s = %g\n", $1, $3); 
                                free($1); 
                            }
    /* Exercise 2: Panic-Mode Error Recovery using Yacc's error token */
    | error '\n'            { 
                                yyerrok; 
                                printf(">> [Panic Recovery]: Discarded error tokens and recovered at newline.\n"); 
                            }
    ;

expr:
    NUMBER                  { $$ = $1; }
    | VARIABLE              { $$ = get_var($1); free($1); }
    | expr '+' expr         { $$ = $1 + $3; }
    | expr '-' expr         { $$ = $1 - $3; }
    | expr '*' expr         { $$ = $1 * $3; }
    | expr '/' expr         { 
                                if ($3 == 0.0) {
                                    yyerror("Division by zero");
                                    $$ = 0.0;
                                } else {
                                    $$ = $1 / $3;
                                }
                            }
    | '-' expr %prec UMINUS { $$ = -$2; }
    | '(' expr ')'          { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax Error: %s\n", s);
}

int main(void) {
    printf("=== Section 4.9: Desktop Calculator with Panic-Mode Error Recovery ===\n");
    printf("Enter expressions or assignments (e.g. 'x = 10', 'x + 5 * 2', Ctrl+D to exit):\n");
    return yyparse();
}
