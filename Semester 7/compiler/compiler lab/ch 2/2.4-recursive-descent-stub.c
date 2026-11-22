/* Section 2.4 - Recursive-Descent Parser stub (C)
   Grammar:  E -> T E' | E' -> + T E' | epsilon
             T -> F T' | T' -> * F T' | epsilon
             F -> id | ( E )
   Compile: gcc 2.4-recursive-descent-stub.c -o rd && ./rd "id + id * id"
*/
#include <stdio.h>
#include <string.h>

char input[256];
int pos = 0;
int ok = 1;

char *lookahead(void) {
    static char tok[32];
    int j = pos;
    while (input[j] == ' ') j++;
    if (input[j] == '\0') return "$";
    int i = 0;
    while (input[j] != ' ' && input[j] != '\0' && i < 31)
        tok[i++] = input[j++];       /* peek only: pos is unchanged */
    tok[i] = '\0';
    return tok;
}

void match(const char *expected) {
    char *t = lookahead();               /* lookahead does not consume */
    if (strcmp(t, expected) == 0) {
        while (input[pos] == ' ') pos++;
        pos += (int)strlen(expected);     /* consume the matched token */
    } else {
        printf("error: expected '%s', found '%s'\n", expected, t);
        ok = 0;
    }
}

void E(void), T(void), F(void);

void Eprime(void) {
    printf("E'()\n");
    if (strcmp(lookahead(), "+") == 0) {
        match("+"); T(); Eprime();
    } else printf("E' -> epsilon\n");
}

void Tprime(void) {
    printf("T'()\n");
    if (strcmp(lookahead(), "*") == 0) {
        match("*"); F(); Tprime();
    } else printf("T' -> epsilon\n");
}

void E(void) { printf("E()\n"); T(); Eprime(); }
void T(void) { printf("T()\n"); F(); Tprime(); }

void F(void) {
    printf("F()\n");
    char *t = lookahead();
    if (strcmp(t, "id") == 0) match("id");
    else if (strcmp(t, "(") == 0) { match("("); E(); match(")"); }
    else { printf("error: expected 'id' or '(', found '%s'\n", t); ok = 0; }
}

int main(int argc, char **argv) {
    if (argc > 1) snprintf(input, sizeof(input), "%s", argv[1]);
    else { printf("Enter tokens (e.g. id + id * id): "); fgets(input, sizeof(input), stdin); }
    E();
    if (strcmp(lookahead(), "$") != 0) { printf("error: unexpected '%s'\n", lookahead()); ok = 0; }
    printf("Result: %s\n", ok ? "ACCEPTED" : "REJECTED");
    return 0;
}
