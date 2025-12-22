#include <stdio.h>
int main()
{
    int i, n, sum = 1, first = 1, second = 1;
    printf("how many fibonacci number you want to see");
    scanf("%d", &n);
    for (i = 1; i <= n; i++) {
        if (i == 1 || i == 2) {
            printf("%d ", 1);
            continue;
        }
        sum = first + second;
        second = first;
        first = sum;
        printf("%d ", sum);
    }
    return 0;
}

// 1 1 2 3 5 8 13 21 34
// 1 1 --> 2 3 5 8
// 1 + 1 = 2
// 2 + 1 = 3
// 3 + 2 = 5
// previous num + the num before previous
