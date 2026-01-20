#include <unistd.h>

int main() {
    execlp("ls", "", "-l", NULL);
    return 0;
}
