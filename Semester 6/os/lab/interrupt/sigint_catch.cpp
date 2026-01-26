#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <sys/wait.h>

void sigint_handler(int sig) {
    printf("\nMini-Shell: Ctrl+C pressed! Exitting...\n");
}

int main() {
    char cmd[100];
    signal(SIGINT, sigint_handler);

    while(1) {
        printf("mini-shell> ");
        fgets(cmd, sizeof(cmd), stdin);
        cmd[strcspn(cmd, "\n")] = 0;

        if(strcmp(cmd, "exit") == 0) break;

        if(fork() == 0) {
            execlp(cmd, cmd, NULL);
            perror("exec failed");
            exit(1);
        } else {
            wait(NULL);
        }
    }
}
