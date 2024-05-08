#include <stdio.h>
void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main() 
{
    intro();
    float a, b, c;
    printf("Input the first number: ");
    scanf("%f", &a);
    printf("Input the second number: ");
    scanf("%f", &b);
    printf("Input the third number: ");
    scanf("%f", &c);

    if (a+b>c && b+c>a && c+a>b) 
    {
        float perimeter = a+b+c;
        printf("Perimeter = %.2f", perimeter);
    } 
    else 
    {
        printf("It is not possible to form a triangle.");
    }

    return 0;
}
