#include <bits/stdc++.h>
using namespace std;

void func(int i) {
    cout << i << endl;
}

int main() {
    thread t1(func, 1);
    t1.join();  
    
    thread t2(func, 2);
    t2.join();  
    return 0;
}