#include <stdio.h>
int GCD(int m, int n);

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main()
{
    intro();
    int num1, num2;
    printf("Enter the two numbers whose GCD is to be found: ");
    scanf("%d %d", &num1, &num2);
    printf("GCD is %d\n", GCD(num1, num2));
    return 0;
}

int GCD(int m, int n)
{
    if (n > m)
        return GCD(n, m);
    else if (n == 0)
        return m;
    else
        return GCD(n, m % n);
}