#include <iostream>
using namespace std;

void swap(int *a, int *b) {
    int temp = *b;
    *b = *a;
    *a = temp;
}

void bubbleSort(int *arr, int n) {
    for (int i=0; i< n; i++) {
        for (int j=0; j < n-i; j++) {
            if (arr[j] > arr[j+1]) {
                swap(&arr[j], &arr[j+1]);
            }
        }
    }
}

void printArray(int *arr, int n) {
    for (int i=0; i < n; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;
}

int main() {
    int arr[] = {12, 2, 39, -4, 25};
    bubbleSort(arr, sizeof(arr)/sizeof(int));
    printArray(arr, sizeof(arr)/sizeof(int));
}