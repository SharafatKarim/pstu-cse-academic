#include <bits/stdc++.h>
using namespace std;

void printArr(vector<int> &arr) {
    for (auto i: arr)
        cout << i << " ";
    cout << endl;
}

int main() {
    vector<int> arr = {1, 20, 13, 44, -5};
    cout << "Before sorting: ";
    printArr(arr);
}
