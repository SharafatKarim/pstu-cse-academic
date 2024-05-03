#include <bits/stdc++.h>
using namespace std;

void print(int ar[], int n) {
    for (int i=0; i <n; i++) {
        cout << ar[i] << " ";
    } cout << "\n";
}

int* merge(int *ar_1, int i, int *ar_2, int j) {
    int p=0, p_1=0, p_2=0;
    int* ar = (int *) malloc((i+j)*sizeof(int));
    while (p_1 < i && p_2 < j) {
        if (ar_1[p_1] < ar_2[p_2]) {
            ar[p++] = ar_1[p_1++];
        } else {
            ar[p++] = ar_2[p_2++];
        }
    }
    while (p_1 < i) {
        ar[p++] = ar_1[p_1++];
    } while (p_2 < j) {
        ar[p++] = ar_2[p_2++];
    }
    return ar;
}

int* mergeSort(int *ar, int n) {
    if (n == 1) return ar;
    int i = n / 2, j = n - i;
    int ar_1[i], ar_2[j];
    for (int k=0; k < i; k++) {
        ar_1[k] = ar[k];
    } for (int k=i, l=0; k<n; k++) {
        ar_2[l++] = ar[k];
    }
    return merge(mergeSort(ar_1, i), i, mergeSort(ar_2, j), j);
}

int main() {
    int ar[] = {8, 2, 4, 6, 9, 7, 10, 1, 5, 3};
    int* sorted = mergeSort(ar, sizeof(ar)/ sizeof(int));
    print(sorted, sizeof(ar)/ sizeof(int));
}
