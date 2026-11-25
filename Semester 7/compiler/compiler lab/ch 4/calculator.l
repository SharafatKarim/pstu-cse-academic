%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "calculator.tab.h"
%}

%%

[ \t]+                  { /* Skip whitespace */ }
\n                      { return '\n'; }

[0-9]+(\.[0-9]+)?       { 
                            yylval.num = atof(yytext); 
                            return NUMBER; 
                        }

[a-zA-Z_][a-zA-Z0-9_]*  { 
                            yylval.id = strdup(yytext); 
                            return VARIABLE; 
                        }

"="                     { return '='; }
"+"                     { return '+'; }
"-"                     { return '-'; }
"*"                     { return '*'; }
"/"                     { return '/'; }
"("                     { return '('; }
")"                     { return ')'; }
";"                     { return ';'; }

.                       { printf("Lexical Error: Unknown character '%s'\n", yytext); }

%%

int yywrap(void) {
    return 1;
}
