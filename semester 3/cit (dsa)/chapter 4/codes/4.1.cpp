#include <iostream>
using namespace std;

void traverse_1(int arr[], int lower_bound, int upper_bound) {
    int temp = lower_bound;
    while (temp <= upper_bound) {
        cout << arr[temp] << " ";
        temp++;
    }
    cout << endl;
}

void traverse_2(int arr[], int lower_bound, int upper_bound) {
    for (int i = lower_bound; i <= upper_bound; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;
}

int main() {
    int arr[5] = {1, 2, 3, 4, 5};
    traverse_1(arr, 0, 4);
    traverse_2(arr, 0, 4);
}