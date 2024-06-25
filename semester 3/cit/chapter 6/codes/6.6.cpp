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
    stack<int> lower, upper;
    lower.push(beg);
    upper.push(end);
    while (!lower.empty()) {
        int loc = quickSortProcess(arr, lower.top(), upper.top());
        beg = lower.top(), end = upper.top();
        lower.pop(), upper.pop();
        if (loc + 1 < end) {
            lower.push(loc+1);
            upper.push(end);
        } if (beg < loc - 1 ) {
            lower.push(beg);
            upper.push(loc - 1);
        }
    }
}

int main() {
    int arr[] = {44, 33, -15, 55, 77, 90, 40, 60, 99, 22, 88, 66};
    quickSort(arr, 0, sizeof(arr)/sizeof(arr[0]) - 1);
    
    cout << "And the sorted array is : " << "\n";
    for (int i = 0; i < sizeof(arr)/sizeof(arr[0]); i++) {
        cout << arr[i] << " ";
    }
}