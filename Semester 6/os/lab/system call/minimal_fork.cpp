#include<bits/stdc++.h>
using namespace std;

int main() {
    int pid = fork();
    if (pid == 0)
        cout << "Child process  -> " << pid << endl;
    else
        cout << "Parent process -> " << pid << endl;
}
