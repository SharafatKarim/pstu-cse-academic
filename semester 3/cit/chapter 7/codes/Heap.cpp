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
};

int main() {
    Heap<int> heap;
    heap.insert(10);
    heap.insert(12);
    heap.insert(123);
    heap.insert(24);
    heap.printAll();
    return 0;
}