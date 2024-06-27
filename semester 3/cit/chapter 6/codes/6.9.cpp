#include<iostream>
using namespace std;

void towerOfHanoi(int n, char beg, char aux, char end) {
    if (n==1) {
        cout << beg << " -> " << end << "\n";
        return;
    }
    towerOfHanoi(n-1, beg, end, aux);
    towerOfHanoi(1, beg, aux, end);
    towerOfHanoi(n-1, aux, beg, end);
}

int main() {
    towerOfHanoi(4, 'A', 'B', 'C');
}