#include <bits/stdc++.h>
using namespace std;

int balance = 0;

void func() {
    int local_bal = balance;
    local_bal++;
    cout << local_bal << endl;
    balance = local_bal;
}

int main() {
    thread t1(func);
    thread t2(func);

    t1.join();  
    t2.join();  
    return 0;
}