#include <stdio.h>

int main()
{
    int data = 1, n;
    printf("Enter the value of n: ");
    scanf("%d", &n);
    for (int i = 0; i < n; i++) {
        for (int j = n; j > i; j--) {
            printf("  ");
        }

        for (int j = 0; j <= i; j++) {
            if (i == 0 || j == 0)
                data = 1;
            else {
                data = data * (i - j + 1) / j;
            }
            printf("%3d", data);
        }
        printf("\n");
    }
}
