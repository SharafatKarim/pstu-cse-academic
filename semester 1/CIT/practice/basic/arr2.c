#include<stdio.h>
int main()
{
    int sz,i;
    scanf("%d",&sz);
    int arr[sz];
    for(i=0;i<sz;i++)
    {
        scanf("%d",&arr[i]);
    }
    printf("Inputing\n");
    for(i=0;i<sz;i++)
    {
        printf("%d\n",arr[i]);
    }
    printf("Insert value and position:\n");
    int val,pos;
    scanf("%d%d",&val,&pos);
    sz++;
    for(i=sz-1;i>=pos;i--)
    arr[i]=arr[i-1];
    arr[pos-1]=val;
    for(i=0;i<sz;i++)
        printf("%d\n",arr[i]);

}
