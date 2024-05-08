#include<stdio.h>
#define PI 3.14159

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

void fahrenheit(int a)
{
    printf("Fahrenheit: %d", ((a * 9) / 5 ) + 32  );
}

int main()
{
    intro();
    int a;
    scanf("%d", &a);
    fahrenheit(a);
    return 0;
}
