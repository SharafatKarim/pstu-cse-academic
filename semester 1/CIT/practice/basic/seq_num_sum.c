#include<stdio.h>
int main()
{
    int size=3,i,arr[size],num1,num2,max=num1,min=num1,sum=0;
    for(i=0;i<size;i++)
    {
        scanf("%d%d",&num1,&num2);
        if(num1<=0 || num2<=0)
        continue;
    }
    if(num2>max)
        max=num2;
    if(num2<min)
        min=num2;
    for(i=min;i<=max;i++)
    {
        sum+=i;
        printf("%d ",i);
    }
    printf("sum =%d",sum);
    printf("\n");

}
