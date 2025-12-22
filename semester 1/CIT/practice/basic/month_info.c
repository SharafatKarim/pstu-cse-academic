#include<stdio.h>
int main()
{
    int x;
    printf("give me a number to know the days belong to it\n");
    scanf("%d",&x);
    switch(x)
    {
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
        printf("the month have 31 days");
        break;
    case 2:
        printf("the month has 28 days");
        printf("the moth has 29 days on a leap year");
        break;
    default:
        printf("the month have 30 days");


    }
    return 0;

}
