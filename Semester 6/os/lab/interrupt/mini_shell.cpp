#include<bits/stdc++.h>
#include<sys/wait.h>

using namespace std;

void sig_handle(int sig_num) {
    cout << "\nCtrl + c pressed! Exiting..." << endl;
    exit(sig_num);
}

int main() {
    signal(SIGINT, sig_handle);

    string s;
    while (true) {
        cout << "mini-shell:";
        cin >> s;
        if (s == "exit") break;

        if (fork() == 0) {
            execlp(s.c_str(), "", NULL);
            exit(1);
        } else {
            wait(NULL);
        }
    }
}
