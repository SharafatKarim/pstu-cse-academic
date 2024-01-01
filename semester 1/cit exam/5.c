#include <stdio.h>

int sum(int arr[], int n)
{
    int result = 0;
    for (int i = 0; i < n; i++) {
        result += arr[i];
    }
    return result;
}

int main()
{
    int n;
    printf("Enter length: ");
    scanf("%d", &n);
    int arr[n];

    printf("Enter elements: ");
    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
    }

    int result;
    result = sum(arr, n);
    printf("Result = %d", result);
    return 0;
}
