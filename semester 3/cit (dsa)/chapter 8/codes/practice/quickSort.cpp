#include <bits/stdc++.h>
using namespace std;

void printArr(vector<int> &arr);

int quickSortProcess(vector<int> &arr, int lo, int hi) {
    int pivot = lo;
    while (lo < hi) {
        while (pivot<hi) {
            if (arr[pivot] <= arr[hi] ) {
                hi--;
            } else {
                swap(arr[pivot], arr[hi]);
                break;
            }
        }
        if (pivot == hi) return pivot;
        pivot = hi;

        while (pivot>lo) {
            if (arr[pivot] >= arr[lo] ) {
                lo++;
            } else {
                swap(arr[pivot], arr[lo]);
                break;
            }
        }
        if (pivot == lo) return pivot;
        pivot = lo;
    }
    return pivot;
}

void quickSort(vector<int> &arr, int lo, int hi) {
    stack<pair<int, int>> st;
    st.push({lo, hi});

    while (!st.empty()) {
        auto [lo, hi] = st.top();
        st.pop();
        if (lo >= hi) continue;
        int pivot = quickSortProcess(arr, lo, hi);
        st.push({lo, pivot-1});
        st.push({pivot+1, hi});
    }
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

    quickSort(arr, 0, 4);
    printArr(arr);

    return 0;
}
