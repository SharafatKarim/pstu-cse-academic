#include<stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main()
{
    intro();
    int total, hour, minutes;
    printf("Input seconds:");
    scanf("%d", &total);
    hour = total / 3600;
    total %= 3600;
    minutes = total / 60;
    total %= 60;
    printf("H:M:S - %d:%d:%d", hour, minutes, total);
}
