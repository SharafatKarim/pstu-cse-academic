#include<stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

void input(int n[])
{
    scanf("%d %d", &n[0], &n[1]);
}

void add(int a, int b)
{
    printf("%d", a+b);
}

int main()
{
    intro();
    int n[3];
    input(n);
    add(n[0], n[1]);
    return 0;
}
