#include <iostream>
#include <unistd.h>     // fork()
#include <sys/types.h>  // pid_t
#include <sys/wait.h>   // wait()

using namespace std;

int main() {
    cout << "--- Start of Main Process ---" << endl;

    pid_t pid = fork();

    if (pid < 0)
        cout << "Error!" << endl;
    else if (pid == 0)
        cout << "I am child  - my id -> " << getpid() << " child -> " << pid << endl;
    else {
        cout << "I am parent - my id -> " << getpid() << " child -> " << pid << endl;
        wait(NULL);
    }

    return 0;
}
