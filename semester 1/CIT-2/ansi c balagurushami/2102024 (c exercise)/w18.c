#include<stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main()
{
    intro();
    int total, year, month;
    printf("Input no. of days: ");
    scanf("%d", &total);
    year = total / 365;
    total %= 365;
    month = total / 30;
    total %= 30;
    printf("%d Year(s)\n", year);
    printf("%d Month(s)\n", month);
    printf("%d Day(s)\n", total);
    return 0;
}
