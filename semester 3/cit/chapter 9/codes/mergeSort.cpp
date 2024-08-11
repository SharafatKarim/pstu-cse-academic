#include <iostream>

using namespace std;

void mergeSortProcess(int* arr, int low, int mid, int high) {
    int i, j, k;
    int temp[high - low + 1];
    for (i = low, j = mid + 1, k = 0; i <= mid || j <= high; k++) {
        if (arr[i] < arr[j]) {
            temp[k] = arr[i];
            i++;
        } else {
            temp[k] = arr[j];
            j++;
        }
    }
    while (i <= mid) {
        temp[k] = arr[i];
        i++;
        k++;
    }
    while (j <= high) {
        temp[k] = arr[j];
        j++;
        k++;
    }
    for (i = low, k = 0; i <= high; i++, k++) {
        arr[i] = temp[k];
    }
}

void mergeSort(int* arr, int low, int high) {
    if (low == high) return;
    int mid = (low + high) / 2;
    
    mergeSort(arr, low, mid);
    mergeSort(arr, mid + 1, high);
    mergeSortProcess(arr, low, mid, high);
}

void print(int* arr, int size) {
    for (int i = 0; i < size; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;
}

int main() {
    int arr[] = {5, 2, 4, 6, -1, 3};
    mergeSort(arr, 0, sizeof(arr)/sizeof(arr[0])-1);
    print(arr, sizeof(arr)/sizeof(arr[0]));
}