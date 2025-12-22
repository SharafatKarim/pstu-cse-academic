#include <stdio.h>

int main()
{
    long int a, b, c, d;
    scanf("%d %d %d %d", &a, &b, &c, &d);

    a = a % 100;
    b = b % 100;
    c = c % 100;
    d = d % 100;

    int multiplication_result;
    multiplication_result = a * b * c * d;

    printf("%02d\n", multiplication_result % 100);
}
