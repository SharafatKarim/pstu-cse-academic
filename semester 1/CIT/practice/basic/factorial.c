#include<stdio.h>
int main()
{
    int n,num,i,fact=1,j;
    scanf("%d",&n);
    for(i =1;i<=n;i++)
    {
       scanf("%d",&num);
    }

    for(i=1;i<=n;i++)
    {
        for(j=1;j<=num;j++)
        {
            fact*=j;
        }
       // printf("%d\n",fact);
    }
     printf("%d\n",fact);
    return 0;
}
