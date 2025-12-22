#include <stdio.h>

void task(void)
{
    int length;
    scanf("%d ", &length);
    char index[length];
    int count = 0;
    // printf("%s\n", index);
    int final = 0;
    int status;
    while (length--) {
        // printf("%d\n", length);
        status = 0;
        char c;
        scanf("%c", &c);
        final += 2;
        for (int i = 0; i < count; i++) {
            if (c == index[i]) {
                final--;
                status = 1;
            }
        }
        if (status)
            continue;

        index[count++] = c;
    }
    printf("%d\n", final);
}

int main()
{
    int test_cases;
    scanf("%d", &test_cases);
    for (int i = 0; i < test_cases; i++)
        task();
    // printf("\nfinish...");
}
