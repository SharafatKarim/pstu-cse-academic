#include<stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main()
{
    intro();
    int a[5];
    int sum = 0;
    int i;
    for(i = 0; i < 5; i++)
    {
        scanf("%d", &a[i]);
        sum += a[i];
    }
    printf("Sum: %d", sum);
    return 0;
}
