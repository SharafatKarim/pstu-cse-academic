#include <stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main()
{
    intro();
    int i;

    char month[12][20] = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};

    printf("Enter the month value: ");
    scanf("%d", &i);

    if (i<1 || i>12)
    {
        printf("incorrect month value!");
    }
    else
        printf("Month = %s", month[--i]);
}