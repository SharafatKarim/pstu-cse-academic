#include <bits/stdc++.h>
using namespace std;

int balance = 0;
// bool locker = false;
atomic<bool> locker{false};

bool test_and_set() {
    // bool temp = locker;
    // locker = true;
    // return temp;
    // return locker.exchange(true);
    return locker.compare_exchange_weak(false, true);
}

void acquire_locker() {
    while(test_and_set());
}

void release_locker() {
    locker = false;
}

void func() {
    acquire_locker();

    int local_bal = balance;
    local_bal++;
    cout << local_bal << endl;
    balance = local_bal;

    release_locker();
}

int main() {
    thread t1(func);
    thread t2(func);
    
    t1.join();  
    t2.join();  
    cout << "Final bal. -> " << balance << endl;

    return 0;
}