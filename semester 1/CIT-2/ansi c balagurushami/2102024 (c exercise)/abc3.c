#include<stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

void add(int a, int b)
{
    printf("%d", a+b);
}

void interest(int a, int b, int c)
{
    printf("Interest = %d", ((a* b* c)/ 100));
}

int main()
{
    intro();
    int n[3];
    scanf("%d %d %d", &n[0], &n[1], &n[2]);
    // add(n[0], n[1]);
    interest(n[0], n[1], n[2]);
    return 0;
}
