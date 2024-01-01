#include<stdio.h>
#define ACCURACY 0.0001

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}


int main()
{
    intro();

    int n, count;
    float x, term, sum;
    printf("Enter a value of x:");
    scanf("%lf", &x);
    n = term = sum = count = 1;

    while (n <= 100)
    {
        term = term * x/n;
        sum = sum + term;
        count = count + 1;
        if (term < ACCURACY)
        {
            n = 999;
        }
        else
        {
            n = n + 1;
        }
        
    }
    printf("Terms = %d Sum = %lf\n", count, sum);
}