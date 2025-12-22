#include <stdio.h>

int main()
{
    int n, i, count = 0;
    scanf("%d", &n);

    long long arr[n];
    for (i = 0; i < n; i++)
        scanf(" %lld", &arr[i]);

    while (1) {
        for (i = 0; i < n; i++)
            if (arr[i] % 2 == 0)
                arr[i] = arr[i] / 2;
            else
                goto print;
        count++;
    }
print:
    printf("%d\n", count);
}
