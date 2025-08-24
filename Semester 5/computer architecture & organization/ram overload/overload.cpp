#include <bits/stdc++.h>
using namespace std;

int main() {
    int a = 1e9;
    int ar[1000][1000]; // 2D = 1e6 (1e3 * 1e3)
    int ar2[1000000]; // 1D = 1e6

    for (auto &i : ar2) {
        i = (int)1e9;
    }

    for (auto &i : ar) {
        for (auto &j: i) {
            j = (int) 1e9;
        }
    }

    size_t N = 4'000'000'000; // ~1 GB worth of ints
    vector<int> big(N, 1e9); // allocate and fill with 1e9
    cout << "Allocated " << (N * sizeof(int)) / (1024.0 * 1024 * 1024) << " GB\n";
    cout << "Allocated " << (N * sizeof(int)) << " b\n";

    return 0;
}
