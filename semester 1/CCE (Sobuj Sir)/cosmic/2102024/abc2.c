#include<stdio.h>
#define PI 3.14159

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

void area(int a)
{
    printf("Area: %f\n", (PI * a * a));
}

void circumference(int a)
{
    printf("Circumference: %f\n", (2 * PI * a));
}

int main()
{
    intro();
    int a;
    scanf("%d", &a);
    area(a);
    circumference(a);
    return 0;
}
