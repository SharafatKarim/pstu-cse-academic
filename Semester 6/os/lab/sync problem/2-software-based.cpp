#include <bits/stdc++.h>
using namespace std;

int shared_id = 0;

int turn = 0;
bool flag[2] = {false, false};

void func(int i) {
    flag[i] = true;
    turn = 1-i;
    while (flag[1-i] && turn == (1-i));

    int id = shared_id;
    id++;
    cout << id << endl;
    shared_id = id;

    flag[i] = false;
}

int main() {
    thread t1(func, 0);
    thread t2(func, 1);

    t1.join();  
    t2.join();  
    cout << "Main thread finished. ID -> " << shared_id << endl;
    return 0;
}