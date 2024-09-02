#include <iostream>
#define MAX 100
using namespace std;

template<typename T> class Heap {
    T arr[MAX];
    int size;
public:
    Heap() {
        size = 0;
        arr[0] = -1;
    }
    void insert(T item) {
        if (size == MAX) {
            cout << "Heap is full\n";
            return;
        }
        size++;
        int temp = size, temp_parent;
        while (temp > 1) {
            temp_parent = temp / 2;
            if (item <= arr[temp_parent]) {
                arr[temp] = item;
                return;
            } 
            arr[temp] = arr[temp_parent];
            temp = temp_parent;
        }
        arr[temp] = item;
    }
    void printAll() {
        for (int i=1; i<=size; i++) {
            cout << arr[i] << " ";
        } cout << endl;
    }
    T deleteMax() {
        T item = arr[1];
        T last = arr[size];
        size--;
        int temp = 1, left = 2, right = 3;
        while (right <= size) {
            if (last >= arr[left] && last >= arr[right]) {
                arr[temp] = last;
                return item;
            }
            if (arr[left] > arr[right]) {
                arr[temp] = arr[left];
                temp = left;
            } else {
                arr[temp] = arr[right];
                temp = right;
            }
            left = 2 * temp;
            right = left + 1;
        }
        if (left == size && last < arr[left]) {
            arr[temp] = arr[left];
            temp = left;
        }
        arr[temp] = last;
        return item;
    }
};

int main() {
    int array [] = {-5, 10, 3, 1, 15, -4, 7, 1};
    Heap<int> heap;
    for (int i=0; i<6; i++) {
        heap.insert(array[i]);
    }
    heap.printAll();

    for (int i=0; i<6; i++) {
        cout << heap.deleteMax() << " ";
    } cout << endl;
    return 0;
}