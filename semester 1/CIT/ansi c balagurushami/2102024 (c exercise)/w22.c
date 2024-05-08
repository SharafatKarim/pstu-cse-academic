#include <stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main()
{
    intro();
    int p[5], i, sum = 0;
    printf("\nInput the first integer: ");
    scanf("%d", &p[0]);
    printf("\nInput the second integer: ");
    scanf("%d", &p[1]);
    printf("\nInput the third integer: ");
    scanf("%d", &p[2]);
    printf("\nInput the fourth integer: ");
    scanf("%d", &p[3]);
    printf("\nInput the fifth integer: ");
    scanf("%d", &p[4]);

    for (i = 0; i < 5; i++)
    {
        if (p[i] % 2 != 0)
        {
            sum += p[i];
        }
    }
    printf("Sum of all odd values: %d", sum);
    return 0;
}