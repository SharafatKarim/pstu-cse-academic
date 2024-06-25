#include <iostream>
#include <stack>
using namespace std;

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

int quickSortProcess(int *arr, int beg, int end) {
    int left = beg, right = end, loc = beg;
    while (true) {
        while (arr[loc] <= arr[right] && loc != right) {
            right--;
        } if (loc == right) return loc; 
        if (arr[loc] > arr[right]) {
            swap(&arr[loc], &arr[right]);
            loc = right;
        } 
        
        while (arr[loc] >= arr[left] && loc != left) {
            left++;
        } if (loc == left) return loc;
        if (arr[loc] < arr[left]) {
            swap(&arr[loc], &arr[left]);
            loc = left;
        }
    }
}

void quickSort(int *arr, int beg, int end) {
    stack<int> 
}

int main() {
    int arr[] = {44, 33, 11, 55, 77, 90, 40, 60, 99, 22, 88, 66};
    cout << "Final pivot location : " << quickSortProcess(arr, 0, sizeof(arr)/sizeof(arr[0]) - 1) << "\n";
    
    cout << "And the array is : " << "\n";
    for (int i = 0; i < sizeof(arr)/sizeof(arr[0]); i++) {
        cout << arr[i] << " ";
    }
}