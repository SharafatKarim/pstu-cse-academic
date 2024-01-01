#include<stdio.h>

int main()
{
    float sum ;
    int n;
    sum = 0;
    for ( n = 1; n <= 10; ++n )
    {
        sum = sum + 1 / (float) n ;
        printf("%2d %6.4f\n", n, sum);
    }
}