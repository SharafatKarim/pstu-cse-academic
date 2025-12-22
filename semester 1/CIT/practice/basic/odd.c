#include <stdio.h>

int main()
{
    int n, result, j = 1;
    printf("Enter your n: ");
    scanf("%d", &n);
    for (int i = 1; i < n; i++, j += 2)
        ;
    printf("Answer      :%d", j);
    return 0;
}
