#include<stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main()
{
    intro();
    int a, b, c;
    scanf("%d %d %d", &a, &b, &c);

    if (a > b && a > c)
        printf("a is greater\n");
    else if (a < b && b > c)
        printf("b is greater\n");
    else
        printf("c is greater\n");
    return 0;
}

