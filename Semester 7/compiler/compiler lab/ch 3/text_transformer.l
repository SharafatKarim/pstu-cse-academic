%{
#include <stdio.h>
%}

%%

"//".*                                    { /* skip single line comments */ }
"/*"([^*]|(\*+[^*/]))*\*+"/"              { /* skip multi-line comments */ }

[0]     { printf("ZERO"); }
[1]     { printf("ONE"); }
[2]     { printf("TWO"); }
[3]     { printf("THREE"); }
[4]     { printf("FOUR"); }
[5]     { printf("FIVE"); }
[6]     { printf("SIX"); }
[7]     { printf("SEVEN"); }
[8]     { printf("EIGHT"); }
[9]     { printf("NINE"); }

[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,} {
    printf("[EMAIL:%s]", yytext);
}

for URL
[http|https]://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,} {
    printf("[URL:%s]", yytext);
}

.       { printf("%s", yytext); }
\n      { printf("%s", yytext); }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
