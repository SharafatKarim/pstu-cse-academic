#include <stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main()
{
    intro();
    double x, y;
    int count;
    count = 1;
    printf("Enter five real numbers in a line \n");
read:
    scanf("%lf", &x);
    if (x < 0)
        printf("Value is negative\n");
    else
    {
        y = sqrt(x);
        printf("%f\t%f\n", x, y);
    }
    count++;
    if (count <= 5)
        goto read;
    printf("\nEnd");
    return 0;
}
