#include<iostream>
using namespace std;

int fibonacciSeries(int n) {
    // This function will return the n'th value of the fibonacci series
    if (n == 0 || n == 1) return n;
    return fibonacciSeries(n-1) + fibonacciSeries(n-2);
}

int main() {
    int n = 10;
    cout << fibonacciSeries(n) << "\n";
}