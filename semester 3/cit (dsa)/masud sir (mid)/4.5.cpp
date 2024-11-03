#include <iostream>
using namespace std;

int linearSearch(int arr[], int n, int item) {
    for (int i=0; i < n; i++) {
        if (arr[i] == item) {
            return i;
        }
    } // While loop? Try yourself!
    return -1;
}

int main() {
    int n;
    cin >> n;

    int arr[n];
    for (int i=0; i<n; i++) {
        cin >> arr[i];
    }
    int item = 39;
    cout << linearSearch(arr, sizeof(arr)/sizeof(int), item) << endl;
}
