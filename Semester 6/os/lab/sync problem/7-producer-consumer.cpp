#include<bits/stdc++.h>
using namespace std;

int BUFFER_SIZE = 5;
int buffer[5];
int count = 0;
int in = 0, out = 0;

void producer() {
    for (int i = 0; i < 10; i++) {
        while (count == BUFFER_SIZE); // wait until buffer is not full

        buffer[in] = i;
        in = (in + 1) % BUFFER_SIZE;
        count++;

        cout << "Produced: " << i << endl;
    }
}

void consumer() {
    for (int i = 0; i < 10; i++) {
        while (count == 0); // wait until buffer is not empty

        int item = buffer[out];
        out = (out + 1) % BUFFER_SIZE;
        count--;

        cout << "Consumed: " << item << endl;
    }
}

int main() {
    thread prod(producer);
    thread cons(consumer);

    prod.join();
    cons.join();

    return 0;
}