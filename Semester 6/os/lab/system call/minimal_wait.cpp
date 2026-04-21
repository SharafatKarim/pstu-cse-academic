#include<bits/stdc++.h>
#include<sys/wait.h>

using namespace std;

int main() {
    int pid = fork();
    if (pid == 0) {
        sleep(5);
        cout << "Child process  -> " << pid << endl;
    } else {
        cout << "Parent process -> " << pid << endl;
        wait(NULL);
    }
}
