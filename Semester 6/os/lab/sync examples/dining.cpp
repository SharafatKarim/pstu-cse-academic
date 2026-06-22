#include<bits/stdc++.h>
using namespace std;

enum state { THINKING, HUNGRY, EATING };

class Philosopher {
    public:
        state s[5];
        Philosopher() {
            for(int i = 0; i < 5; i++) {
                s[i] = THINKING;
            }
        }
        void test(int i);
        void pickUp(int i);
        void putDown(int i);
};

void Philosopher::test(int i) {
    if (s[i] == HUNGRY && s[(i + 4)%5] != EATING && s[(i + 1) % 5] != EATING) {
        s[i] = EATING;
    }
}

void Philosopher::pickUp(int i) {
    s[i] = HUNGRY;
    if (s[i] != EATING) {
        test(i);
    }
    printf("Philosopher %d is %s\n", i, (s[i] == EATING) ? "EATING" : "HUNGRY");
}

void Philosopher::putDown(int i) {
    s[i] = THINKING;
    test((i + 4) % 5);
    test((i + 1) % 5);
}

void randomCall(Philosopher &p) {
    int i = rand() % 5;
    int action = rand() % 2;
    if (action == 0) {
        p.pickUp(i);
    } else {
        p.putDown(i);
    }
}

int main() {
    srand(time(0));

    Philosopher p;
    thread t[10];
    for (int i = 0; i < 10; i++) {
        t[i] = thread(randomCall, ref(p));
    }
    for (int i = 0; i < 10; i++) {
        t[i].join();
    }

    return 0;
}