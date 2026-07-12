#include<bits/stdc++.h>
using namespace std;

void func() {
    cout << "hello from a thread..." << endl;
}

int main() {
    thread t[3];
    for (int i = 0; i < 3; i++) {
        t[i] = thread(func);
        t[i].join();
    }
    cout << "Thread finished!" << endl;
}
