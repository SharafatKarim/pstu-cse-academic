#include <iostream>
using namespace std;

int deleteElement(int arr[], int n, int k) {
    // int item = arr[k]; // for processing     
    for (int j=k; j < n-1; j++) {
        arr[j] = arr[j+1];
    }
    return n - 1;
}

void printArray(int arr[], int n) {
    for (int i=0; i < n; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;
}

int main() {
    int arr[50] = {1, 2, 3, 4, 5};
    int n = 5; // number of elements in the array
    int k = 2; // position to deleteElement a new value

    n = deleteElement(arr, n, k - 1);
    printArray(arr, n);
}