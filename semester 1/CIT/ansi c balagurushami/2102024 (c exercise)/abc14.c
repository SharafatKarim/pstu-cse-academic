#include<stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main()
{
    intro();
    int a, y;
    scanf("%d", &a);
    a <<= 3;
    y = a;
    printf("%d", y );
    return 0;
}

