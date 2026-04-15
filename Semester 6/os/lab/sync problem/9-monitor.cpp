#include <bits/stdc++.h>
using namespace std;

class DiningMonitor {
private:
    enum State { THINKING, HUNGRY, EATING };
    vector<State> state;
    vector<condition_variable> self;
    mutex m;
    int n;

public:
    DiningMonitor(int philosophers) : n(philosophers) {
        state.resize(n, THINKING);
        self.resize(n);
    }

    void pickup(int i) {
        unique_lock<mutex> lock(m);
        state[i] = HUNGRY;
        cout << "Philosopher " << i << " is HUNGRY" << endl;
        test(i);
        
        while (state[i] != EATING) {
            self[i].wait(lock);
        }
        cout << "Philosopher " << i << " is EATING" << endl;
    }

    void putdown(int i) {
        unique_lock<mutex> lock(m);
        state[i] = THINKING;
        cout << "Philosopher " << i << " is THINKING" << endl;
        
        test((i + n - 1) % n);
        test((i + 1) % n);
    }

private:
    void test(int i) {
        if (state[i] == HUNGRY &&
            state[(i + n - 1) % n] != EATING &&
            state[(i + 1) % n] != EATING) {
            state[i] = EATING;
            self[i].notify_one();
        }
    }
};

void philosopher(int id, DiningMonitor& monitor) {
    for (int i = 0; i < 3; i++) {
        monitor.pickup(id);
        this_thread::sleep_for(chrono::milliseconds(100));
        monitor.putdown(id);
        this_thread::sleep_for(chrono::milliseconds(50));
    }
}

int main() {
    DiningMonitor monitor(5);
    vector<thread> threads;

    for (int i = 0; i < 5; i++) {
        threads.emplace_back(philosopher, i, ref(monitor));
    }

    for (auto& t : threads) {
        t.join();
    }

    cout << "All philosophers finished eating" << endl;
    return 0;
}