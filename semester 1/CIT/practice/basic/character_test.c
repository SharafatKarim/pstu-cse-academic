#include <stdio.h>

int main()
{
    char c;
    scanf("%c", &c);

    if (c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z')
        printf("This is an alphabet\n");

    else if (c >= '0' && c <= '9')
        printf("This is a number\n");

    else
        printf("Something else\n");
}
