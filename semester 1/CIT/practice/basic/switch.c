#include<stdio.h>
#include "conio.h"
int main()
{
    int a,b;
    char ch;
    scanf("%d %c %d",&a,&ch,&b);
    clrscr();
    switch(ch)
    {
    case '<':
        {
            if(a<b)
                printf("Right");
            else
                printf("Wrong");
            break;
        }
    case '>':
        {
            if(a>b)
                printf("Right");
            else
                printf("Wrong");
            break;
        }
    case '=':
        {
            if(a==b)
                printf("Right");
            else
                printf("Wrong");
            break;
        }

    }
    return 0;
}
