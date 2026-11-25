%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "c_parser.tab.h"
%}

DIGIT       [0-9]
LETTER      [a-zA-Z_]
ID          {LETTER}({LETTER}|{DIGIT})*
NUMBER      {DIGIT}+(\.{DIGIT}+)?

%%

[ \t\r\n]+                          { /* Skip whitespace */ }
"//".*                              { /* Skip single line comment */ }
"/*"([^*]|(\*+[^*/]))*\*+"/"        { /* Skip multiline comment */ }

"int"       { yylval.str = strdup(yytext); return INT; }
"float"     { yylval.str = strdup(yytext); return FLOAT; }
"if"        { return IF; }
"else"      { return ELSE; }
"while"     { return WHILE; }
"return"    { return RETURN; }

"=="        { return EQ; }
"!="        { return NE; }
"<="        { return LE; }
">="        { return GE; }
"<"         { return LT; }
">"         { return GT; }

"="         { return '='; }
"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }

"("         { return '('; }
")"         { return ')'; }
"{"         { return '{'; }
"}"         { return '}'; }
";"         { return ';'; }

{NUMBER}    { yylval.str = strdup(yytext); return NUM; }
{ID}        { yylval.str = strdup(yytext); return IDENTIFIER; }

.           { printf("Unknown character: %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}
