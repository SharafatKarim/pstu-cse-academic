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
    printf("The largest value is: \n");

    if (a>b)
    {
        if (a>c)
        {
            printf("%d", a);
        }
        else
        {
            printf("%d", c);
        }
    }
    else
    {
        if (b>c)
        {
            printf("%d", b);
        }
        else
        {
            printf("%d", c);
        }
    }
}