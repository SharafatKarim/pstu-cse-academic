#include<bits/stdc++.h>
using namespace std;

int main() {
    int target_pid = 1234;
    if (kill(target_pid, SIGKILL) == 0)
        cout << "Killed " << target_pid << endl;
    else
        cout << "Not found!" << endl;
}
