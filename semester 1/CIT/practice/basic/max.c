#include <stdio.h>

int main()
{
    int n;
    scanf("%d", &n);
    // taking n number

    int a[n];
    // creating an array of n'th elements

    // a loop to take all numbers as input
    int i;
    for (i = 0; i < n; i++)
    {
        scanf("%d", &a[i]);
    }

    // an another loop to find the max number
    int max = a[0];
    for (i = 0; i < n; i++)
    {
        if (a[i] > max)
            max = a[i];
    }

    // finally print
    printf("%d", max);

}
