#include<stdio.h>
int main()
{
    int num[10],n,i,max1,max2,temp;
    scanf("%d",&n);
    for(i=0;i<n;i++)
    {
        scanf("%d",&num[i]);
    }
    max1=0;
    for(i=0;i<n;i++){
    if(max1<num[i])
    {
        max2=max1;
        max1=num[i];
    }
    }
    printf("1st large number: %d\n",max1);
    printf("2nd large number: %d",max2);
    return 0;
}
