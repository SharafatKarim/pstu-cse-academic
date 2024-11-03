#include <bits/stdc++.h>
using namespace std;

void printArr(vector<int> &arr);

void mergeSortProcess(vector<int> &arr, int low, int mid, int high) {
    vector<int> temp(high-low+1);
    int i = low, j = mid, k = 0;
    while (i <= mid-1 && j <= high) {
        if (arr[i] <= arr[j]) {
            temp[k++] = arr[i++];
        } else {
            temp[k++] = arr[j++];
        }
    }
    while (i <= mid-1) {
        temp[k++] = arr[i++];
    }
    while (j <= high) {
        temp[k++] = arr[j++];
    }
    for (i = low; i <= high; i++) {
        arr[i] = temp[i-low];
    }
}

void mergeSort(vector<int> &arr, int low, int high) {
    if (low >= high) return;
    int mid = (low + high) / 2;
    mergeSort(arr, low, mid);
    mergeSort(arr, mid+1, high);
    mergeSortProcess(arr, low, mid+1, high);
}

void printArr(vector<int> &arr) {
    for (auto i: arr)
        cout << i << " ";
    cout << endl;
}

int main() {
    vector<int> arr = {1, 20, 13, 44, -5}; // -5 1 13 20 44
    cout << "Before sorting: ";
    printArr(arr);

    mergeSort(arr, 0, 4);
    // mergeSortProcess(arr, 1, 1, 2);
    printArr(arr);

    return 0;
}
