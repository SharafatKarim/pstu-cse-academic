#include<bits/stdc++.h>
using namespace std;

int mutx = 0;
void wait_mutx() {
    while (mutx) {
        // wait
    }
    mutx = 1;
}
void signal_mutx() {
    mutx = 0;
}

int rw_mutx = 0;
void wait_rw_mutx() {
    while (rw_mutx) {
        // wait
    }
    rw_mutx = 1;
}
void signal_rw_mutx() {
    rw_mutx = 0;
}

// action = 0 -> leave
// action = 1 -> enter

void writer(int action) {
    if (action) {
        wait_rw_mutx();
        cout << "Writer is writing..." << endl;
        sleep(1); // Simulate writing time
    } else {
        signal_rw_mutx();
        cout << "Writer has finished writing." << endl;
        sleep(1); // Simulate time after writing
    }
}

int readers_count = 0;
void reader(int action) {
    if (action) {
        wait_mutx();
        readers_count++;
        if (readers_count == 1) {
            wait_rw_mutx();
        }
        signal_mutx();
        cout << "Reader is reading..." << endl;
        sleep(1); // Simulate reading time
    } else {
        wait_mutx();
        readers_count--;
        if (readers_count == 0) {
            signal_rw_mutx();
        }
        signal_mutx();
        cout << "Reader has finished reading." << endl;
        sleep(1); // Simulate time after reading
    }
}

int main() {
    thread t1(writer, 1);
    thread t2(reader, 1);
    thread t3(reader, 1);
    thread t4(reader, 0);
    thread t5(writer, 0);

    t1.join();
    t2.join();
    t3.join();
    t4.join();
    t5.join();

    return 0;
}