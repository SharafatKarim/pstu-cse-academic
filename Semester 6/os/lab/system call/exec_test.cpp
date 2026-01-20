#include <unistd.h>
#include <iostream>
#include <sys/types.h>

int main() {
    execlp("ls", "", "-l", NULL);
    return 0;
}
