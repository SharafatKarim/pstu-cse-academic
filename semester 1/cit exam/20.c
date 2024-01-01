#include <stdio.h>

void bubble_sort(int* arr, int n)
{
    // for (int i = 0; i < n; i++) {
    //     int sorted = 0;
    //     for (int j = 0; j < (n); j++) {
    //         if (arr[j] > arr[j + 1]) {
    //             int temp = arr[j];
    //             arr[j] = arr[j + 1];
    //             arr[j + 1] = temp;
    //             sorted++;
    //         }
    //     }
    //     if (sorted == 0)
    //         break;
    // }
    for (int i = 0; i < n; i++) {
        for (int j = i + 1; j < n; j++) {
            if (arr[i] > arr[j]) {
                int temp = arr[j];
                arr[j] = arr[i];
                arr[i] = temp;
            }
        }
    }
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

    bubble_sort(arr, n);

    // printf("Largest number = %d\n", arr[n - 1]);
    printf("Sorted array is: \n");

    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    return 0;
}
