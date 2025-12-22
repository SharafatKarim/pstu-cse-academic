#include <stdio.h>

int main()
{
    int n;
    scanf("%d", &n);

    int i, j;
    for ( i = 0; i < n; i++ )
    {
        for ( j = n - i ; j > 0 ; j-- )
        {
            printf("* ");
        }
        printf("\n");
    }
}
