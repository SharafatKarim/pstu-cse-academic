#include <stdio.h>

int main()
{
    int n, temp;
    scanf("%d", &n);

    int i, j;
    for ( i = 0; i < n; i++ )
    {
        for ( j = n ; j > i ; j-- )
        {
            printf("  ");
        }
        for ( j = 0, temp = i + 1 ; j <= i ; j++, temp++ )
        {
            printf("%d ", temp);
        }
        for ( j = 0, temp = temp - 2 ; j < i ; j++ )
        {
            printf("%d ", temp--);
        }
        printf("\n");
    }
}
