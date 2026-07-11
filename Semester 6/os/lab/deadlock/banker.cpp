#include <bits/stdc++.h>
using namespace std;

int resource_num = 3;
int thread_num = 5;

int total_resources[3] = {10, 5, 7};
int allocation[5][3] = {{0, 1, 0},
                        {2, 0, 0},
                        {3, 0, 2},
                        {2, 1, 1},
                        {0, 0, 2}};
int max_need[5][3] = {{7, 5, 3},
                      {3, 2, 2},
                      {9, 0, 2},
                      {2, 2, 2},
                      {4, 3, 3}};

int available[3];
int need[5][3];

void calculate_need() {
    for (int i = 0; i < thread_num; i++) {
        for (int j = 0; j < resource_num; j++) {
            need[i][j] = max_need[i][j] - allocation[i][j];
        }
    }
}

void calculate_available() {
    for (int j = 0; j < resource_num; j++) {
        int sum = 0;
        for (int i = 0; i < thread_num; i++) {
            sum += allocation[i][j];
        }
        available[j] = total_resources[j] - sum;
    }
}

// Banker's algorithm to check if the system is in a safe state
bool is_safe() {
    calculate_available();
    calculate_need();

    int work[3];
    for (int j = 0; j < resource_num; j++) {
        work[j] = available[j];
    }

    bool finish[5] = {false, false, false, false, false};

    for (int i = 0; i < thread_num; i++) {
        if (!finish[i]) {
            bool can_allocate = true;
            for (int j = 0; j < resource_num; j++) {
                if (need[i][j] > work[j]) {
                    can_allocate = false;
                    break;
                }
            }

            if (can_allocate) {
                for (int j = 0; j < resource_num; j++) {
                    work[j] += allocation[i][j];
                }
                finish[i] = true;
                cout << "Thread " << i << " done" << endl;
                i = -1; // reset loop
            }
        }
    }

    for (int i = 0; i < thread_num; i++) {
        if (!finish[i]) {
            return false;
        }
    }

    return true;
}

int main() {
    if (is_safe()) {
        cout << "The system is in a safe state." << endl;
    } else {
        cout << "The system is in an unsafe state." << endl;
    }

    return 0;
}