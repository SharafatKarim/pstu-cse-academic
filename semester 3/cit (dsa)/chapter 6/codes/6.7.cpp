#include<iostream>
using namespace std;

int factorialWithLoop(int n) {
    if (n == 0) return 1;
    int fact = 1;
    for (int i=1; i <= n; i++) {
        fact *= i;
    } return fact;
}

int factorialWithRecursion(int n) {
    if (n == 0) return 1;
    return n * factorialWithRecursion(n-1);
}

int main() {
    int n = 4;
    cout << factorialWithLoop(n) << "\n";
    cout << factorialWithRecursion(n) << "\n";
}