%{
#include <stdio.h>
int chars = 0;
int words = 0;
int lines = 0;
%}

%%

[a-zA-Z]+ { words++; chars += strlen(yytext); }
\n        { lines++; chars++; }
.         { chars++; }

%%

int main() {
    printf("Enter text (Ctrl+D to end):\n");
    yylex();
    printf("\nLines: %d\nWords: %d\nCharacters: %d\n", lines, words, chars);
    return 0;
}

int yywrap() {
    return 1;
}
