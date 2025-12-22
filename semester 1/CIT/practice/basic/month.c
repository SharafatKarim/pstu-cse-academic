#include<stdio.h>
int main()
{
    int monno;
    printf("Input Month No : ");
    scanf("%d",&monno);
    switch(monno)
    {
        case1:
        case3:
        case5:
        case7:
        case8:
        case10:
        case12:
               printf("Month have 31 days. \n");
               break;
        case2:
               printf("The 2nd month is a February and have 28 days. \n");
             printf("in leap year The February month  Have 29 days.\n");
             break;
        case4:
        case6:
        case9:
        case11:
               printf("Month have 30 days. \n");
             break;
     default:
               printf("invalid Month number.\nPlease try again ....\n");
             break;
    }
}
