#include <stdio.h>

int main()
{
    int n;
    scanf("%d", &n);
    int arr[n];
    int i, j;
    for (i=0; i< n; i++)
        scanf("%d", &arr[i]);

    printf("\nLet's reverse it \n");
    int arr_temp[n];
    for (j=n-1, i=0; i<n; i++, j--)
        arr_temp[j] = arr[i];

    for (i=0; i< n; i++)
        printf("%d ", arr_temp[i]);

    printf("\nLet's insert one more... \n");
    int arr_temp2[n+1];
    int one;
    scanf("%d", &one);
    for (j=n-1, i=0; i<n; i++, j--)
        arr_temp2[j] = arr[i];
    arr_temp2[n] = one;
    for (i=0; i< n+1; i++)
        printf("%d ", arr_temp2[i]);

}
