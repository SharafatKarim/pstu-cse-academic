#include<stdio.h>
int main()
{
    double x,y;
    char op;
    printf("give me a value of two number\n");
    scanf("%lf%lf",&x,&y);
    printf("now choose your operator +,-,*,/\n");
    scanf("\n%c",&op);
    switch(op)
    {
    case '+':
        printf("the value is %lf+%lf=%lf",x,y,x+y);
        break;
        case '-':
        printf("the value is %lf-%lf=%lf",x,y,x-y);
        break;
        case '*':
        printf("the value is %lf*%lf=%lf",x,y,x*y);
        break;
        case '/':
        printf("the value is %lf/%lf=%lf",x,y,x/y);
        break;
        default:
            printf("i am going to try again and again");
    }
    return 0;
}
