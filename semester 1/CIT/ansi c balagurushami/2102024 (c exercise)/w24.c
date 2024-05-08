// Write a C program that reads two integers and checks whether they are multiplied or not.
#include <stdio.h>
void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main() 
{
    intro();
    int a, b;
    printf("Input the first number: ");
    scanf("%d", &a);
    printf("Input the second number: ");
    scanf("%d", &b);

    if (b > a)
    {
        int c = b;
        b = a;
        a = c;
    }

    if (a % b == 0) 
    {
        printf("Multiplied");
    } 
    else 
    {
        printf("Not multiplied");
    }

    return 0;
}
