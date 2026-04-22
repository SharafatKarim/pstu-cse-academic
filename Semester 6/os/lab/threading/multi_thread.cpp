#include<bits/stdc++.h>
using namespace std;

void func() {
    cout << "hello from a thread..." << endl;
}

int main() {
    vector<thread> threads;

    for (int i=0; i<5; i++) {
        threads.push_back(thread(func));
    }

    for (auto& i: threads) {
        if (i.joinable())
            i.join();
    }

    thread t1(func);
    t1.join();

    cout << "Thread finished!" << endl;
}
