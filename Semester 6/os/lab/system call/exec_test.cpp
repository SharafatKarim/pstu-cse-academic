#include <unistd.h>

int main() {
    execlp("ls", "", "-la", NULL);
    return 0;
}
