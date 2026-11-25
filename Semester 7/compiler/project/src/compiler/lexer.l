%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include "ast.h"
#include "parser.tab.h"

int yycolumn = 1;

#define YY_USER_ACTION \
    yylloc.first_line = yylineno; \
    yylloc.first_column = yycolumn; \
    yylloc.last_line = yylineno; \
    yylloc.last_column = yycolumn + yyleng - 1; \
    yycolumn += yyleng;

static char *my_strdup(const char *s) {
    if (!s) return NULL;
    size_t len = strlen(s) + 1;
    char *d = (char *)malloc(len);
    if (d) memcpy(d, s, len);
    return d;
}
%}

%option noyywrap
%option yylineno

DIGIT       [0-9]
LETTER      [a-zA-Z_]
ID          {LETTER}({LETTER}|{DIGIT})*
INT_LIT     {DIGIT}+
FLOAT_LIT   {DIGIT}+\.{DIGIT}+([eE][+-]?{DIGIT}+)?

%%

[ \t\r]+                            { /* Skip horizontal whitespace */ }
\n                                  { yycolumn = 1; }
"//".*                              { /* Skip single-line comment */ }
"/*"([^*]|(\*+[^*/]))*\*+"/"        {
                                        /* Multi-line comment: update yycolumn for newlines */
                                        for (int i = 0; i < yyleng; i++) {
                                            if (yytext[i] == '\n') yycolumn = 1;
                                        }
                                    }

"int"                               { return INT; }
"float"                             { return FLOAT; }
"if"                                { return IF; }
"else"                              { return ELSE; }
"while"                             { return WHILE; }
"return"                            { return RETURN; }
"print"                             { return PRINT; }
"println"                           { return PRINTLN; }

"=="                                { return EQ; }
"!="                                { return NE; }
"<="                                { return LE; }
">="                                { return GE; }
"<"                                 { return '<'; }
">"                                 { return '>'; }
"="                                 { return '='; }
"+"                                 { return '+'; }
"-"                                 { return '-'; }
"*"                                 { return '*'; }
"/"                                 { return '/'; }
"!"                                 { return '!'; }

"("                                 { return '('; }
")"                                 { return ')'; }
"{"                                 { return '{'; }
"}"                                 { return '}'; }
";"                                 { return ';'; }

{FLOAT_LIT}                         {
                                        yylval.float_val = atof(yytext);
                                        return NUM_FLOAT;
                                    }
{INT_LIT}                           {
                                        yylval.int_val = (int64_t)atoll(yytext);
                                        return NUM_INT;
                                    }
{ID}                                {
                                        yylval.str = my_strdup(yytext);
                                        return IDENTIFIER;
                                    }

.                                   {
                                        fprintf(stderr, "Lexical Error [%d:%d]: unexpected character '%s'\n",
                                                yylineno, yycolumn, yytext);
                                    }

%%
