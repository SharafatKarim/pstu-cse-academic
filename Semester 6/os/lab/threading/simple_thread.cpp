#include<bits/stdc++.h>
using namespace std;

void func() {
    cout << "hello from a thread..." << endl;
}

int main() {
    thread t1(func);
    t1.join();

    cout << "Thread finished!" << endl;
}
