#include<stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main()
{
    intro();
    int a[3];
    scanf("%d %d %d", &a[0], &a[1], &a[2]);
    if (a[0] > a[1] && a[0] > a[2])
        printf("%d is the biggest", a[0]);
    else if (a[2] > a[1] && a[2] > a[0])
        printf("%d is the biggest", a[2]);
    else
        printf("%d is the biggest", a[1]);
    return 0;
}
