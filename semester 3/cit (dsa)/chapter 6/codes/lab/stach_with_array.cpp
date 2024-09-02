#include <bits/stdc++.h>

using namespace std;

int MAX_RANGE = 1000;
long long pos;
long long ar[1000];

void push(int data) {
    if (pos == MAX_RANGE) {
        cout << "OVERFLOW";
        return;
    }
    pos++;
    ar[pos] = data;
}

void top() {
    cout << ar[pos] << endl;
}

void pop() {
    if (pos == 0)
        cout << "UNDERFLOW";
    pos--;
}

int main() {
    push(2);
    push(5);
    pop();
    top();
    return 0;
}
