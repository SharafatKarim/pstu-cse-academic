#include <stdio.h>
int PrimeOrNot(int);
int main()
{
    int n1, prime;
    printf(" Input a positive number : ");
    scanf("%d", &n1);
    for (int j = 1; j <= n1; j++) {
        prime = PrimeOrNot(j);
        if (prime != 0)
            printf("%d, ", j);
    }
    return 0;
}
int PrimeOrNot(int n1)
{

    int i = 2;
    while (i <= n1 / 2) {
        if (n1 % i == 0)
            return 0;
        else
            i++;
    }
    return 1;
}
