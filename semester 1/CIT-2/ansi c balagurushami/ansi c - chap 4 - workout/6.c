#include<stdio.h>

int main()
{
    float sum, n, term;
    int count = 1;

    sum = 0;
    printf("Enter value of n\n");
    scanf("%f", &n);
    term = 1.0 / n ;
    while ( count <= n )
    {
        sum = sum + term ;
        count++;
    }
    printf("Sum = %f\n", sum);
    printf("Count = %d\n", count);
    
}