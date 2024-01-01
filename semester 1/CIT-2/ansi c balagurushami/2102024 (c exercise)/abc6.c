#include<stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main()
{
    intro();
    int a, b;
    scanf("%d %d", &a, &b);

    printf("before: \n");
    printf("a: %d\n", a);
    printf("b: %d\n", b);

    a = a + b;
    b = a - b;
    a = a - b;

    printf("after: \n");
    printf("a: %d\n", a);
    printf("b: %d\n", b);
    return 0;
}
