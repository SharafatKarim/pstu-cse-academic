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
    while (s[i] != EATING) {
        test(i);
    }
    printf("Philosopher %d is %s\n", i, (s[i] == EATING) ? "EATING" : "HUNGRY");
}

void Philosopher::putDown(int i) {
    s[i] = THINKING;
}

int main() {
    Philosopher p;
    thread t[5];
    t[0] = thread(&Philosopher::pickUp, &p, 0);
    t[1] = thread(&Philosopher::pickUp, &p, 1);
    t[2] = thread(&Philosopher::putDown, &p, 0);
    t[3] = thread(&Philosopher::putDown, &p, 1);

    t[0].join();
    t[1].join();
    t[2].join();
    t[3].join();

    return 0;
}