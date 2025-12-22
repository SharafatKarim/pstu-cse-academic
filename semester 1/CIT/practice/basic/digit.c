#include<stdio.h>
#include<cstdlib>

void printArray(int *arr, int size)
{
    for (int i = 0; i < size; i++)
    {
        printf("%d, ", arr[i]);
    }
    printf("\n");
}

int* merge(int *ar_1, int i, int *ar_2, int j) {
    int p=0, p_1=0, p_2=0;
    int* ar = (int *) malloc(((i+j)*sizeof(int)));
    while (p_1 < i && p_2 < j) {
        if (ar_1[p_1] < ar_2[p_2]) {
            ar[p++] = ar_1[p_1++];
        } else {
            ar[p++] = ar_2[p_2++];
        }
    }
    while (p_1 < i) {
        ar[p++] = ar_1[p_1++];
    } while (p_2 < j) {
        ar[p++] = ar_2[p_2++];
    }
    return ar;
}

int* mergeArray(int *ar_1, int arr1Size, int *ar_2, int arr2Size)
{

    // printArray(arr1, arr1Size);
    // printArray(arr2, arr2Size);

    int totalSize = arr1Size + arr2Size;
    int *newArr = (int*)malloc(totalSize * sizeof(int));
    int i1 = 0;
    int i2 = 0;
    for (int i = 0; i < totalSize; i++)
    {
        if (i1 + 1 > arr1Size)
        {
            newArr[i] = ar_2[i2++];
            continue;
        }
        if (i2 + 1 > arr2Size)
        {
            newArr[i] = ar_1[i1++];
            continue;
        }
        if (ar_1[i1] < ar_2[i2])
        {
            newArr[i] = ar_1[i1++];
        }
        else
        {
            newArr[i] = ar_2[i2++];
        }
    }
    // printArray(newArr, totalSize);
    return newArr;
}

int* devideArray(int *arr, int size)
{
    if (size <= 1) return arr;

    int arr1Length = size / 2;
    int arr2Length = size % 2 == 0 ? arr1Length : arr1Length + 1;
    int arr1[arr1Length], arr2[arr2Length];
    if (arr1Length != arr2Length)
        arr2[arr1Length] = arr[size - 1];
    for (int i = 0; i < arr1Length; i++)
    {
        arr1[i] = arr[i];
        arr2[i] = arr[arr1Length + i];
    }

    // printArray(arr1, arr2Length);
    // printArray(arr2, arr1Length);
    // printf("%d\n", arr1Length);

    int *newArr1, *newArr2;
    // if (arr1Length > 1)
        newArr1 = devideArray(arr1, arr1Length);
    // if (arr2Length > 1)
        newArr2 = devideArray(arr2, arr2Length);


    // return mergeArray(newArr1, arr1Length, newArr2, arr2Length);
    return merge(newArr1, arr1Length, newArr2, arr2Length);
}

int main()
{
    int ind = 6;
    int arr[ind] = {5,-6,2,85,65,9};
    // int arr[ind] = {5, 1, 3};

    printArray(arr, ind);
    int *arr5 = devideArray(arr, ind);
    printArray(arr5, ind);
    return 0;
}
