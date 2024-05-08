#include<stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main()
{
    intro();
    int a;
    scanf("%d", &a);

    int b = 0;
    int rev= 0;
    for (;a >= 1;)
    {
        b = a % 10;
        rev = (rev * 10) + b;
        a /= 10;
    }
    printf("Reverse: %d", rev);
    return 0;
}
