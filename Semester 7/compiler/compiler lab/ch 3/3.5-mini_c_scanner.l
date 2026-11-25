%{
#include <stdio.h>
/* This lexer identifies basic tokens for a mini-C subset */
%}

/* Regular Definitions */
DIGIT       [0-9]
LETTER      [a-zA-Z_]
ID          {LETTER}({LETTER}|{DIGIT})*
NUMBER      {DIGIT}+(\.{DIGIT}+)?([eE][+-]?{DIGIT}+)?

%%

[ \t\n\r]+  { /* Skip whitespace */ }

"/*"        { 
                /* Multi-line comment handler */
                int c;
                while ((c = input()) != 0) {
                    if (c == '*') {
                        if ((c = input()) == '/') break;
                        else unput(c);
                    }
                }
            }

"//".*      { /* Skip single-line comments */ }

"if"|"else"|"int"|"float"|"return"|"while"|"for" {
                printf("KEYWORD:    %s\n", yytext);
            }

{ID}        { printf("IDENTIFIER: %s\n", yytext); }

{NUMBER}    { printf("NUMBER:     %s\n", yytext); }

"=="|"!="|"<="|">="|"<"|">" {
                printf("REL_OP:     %s\n", yytext);
            }

"="|"+"|"-"|"*"|"/" {
                printf("ARITH_OP:   %s\n", yytext);
            }

"("|")"|"{"|"}"|";"|"," {
                printf("PUNCTUATION: %s\n", yytext);
            }

.           { printf("ERROR: Unknown character '%s'\n", yytext); }

%%

int main() {
    printf("Lexical Analyzer started. Enter code snippet:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
