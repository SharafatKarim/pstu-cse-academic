#include<bits/stdc++.h>
using namespace std;

void sig_int(int sig_num) {
    cout << "Received signal, " << sig_num << endl;
    exit(sig_num);
}

int main() {
    signal(SIGINT, sig_int);
    while (true);
}
