#include <stdio.h>

typedef long long int li;

void process(li n)
{
    li sum = 0;
    for (li i = 1, j = 3; j < n; i++, j = 3 * i)
        sum += j;
    for (li i = 1, j = 5; j < n; i++, j = 5 * i)
        if (j % 3 != 0)
            sum += j;
    printf("%lld\n", sum);
}

int main()
{
    int t;
    scanf("%d", &t);
    for (int a0 = 0; a0 < t; a0++) {
        li n;
        scanf("%lld", &n);
        process(n);
    }
    return 0;
}
