#include <bits/stdc++.h>
using namespace std;

int shared_id = 0;

void func() {
    int id = shared_id;
    id++;
    cout << id << endl;
    shared_id = id;
}

int main() {
    thread t1(func);
    thread t2(func);

    t1.join();  
    t2.join();  
    cout << "Main thread finished. ID -> " << shared_id << endl;
    return 0;
}