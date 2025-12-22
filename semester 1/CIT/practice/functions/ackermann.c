#include <stdio.h>

long double ackermann(long double m, long double n)
{
    if (m < 0 || n < 0) {
        printf("Not possible!\n");
        return -1;
    } else if (m == 0)
        return n + 1;
    else if (m > 0 && n == 0)
        return ackermann(m - 1, 1);
    else
        return ackermann(m - 1, ackermann(m, n - 1));
}

int main()
{
    printf("%Le", ackermann(4, 4));
}
