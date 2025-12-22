#include<stdio.h>
int main()
{
    int sz,i,temp;
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
    // printf("Insert value and position:\n");
    // int val,pos;
    // scanf("%d%d",&val,&pos);
    // sz++;
    // for(i=sz-1;i>=pos;i--)
    // arr[i]=arr[i-1];
    // arr[pos-1]=val;
    // for(i=0;i<sz;i++)
    //     printf("%d\n",arr[i]);

    printf("Shorting those elsements:\n");
    for(i=0;i<sz;i++)
    {
        for(int j=i+1;j<sz;j++)
        {
            if(arr[i]>arr[j])
            {
                temp = arr[i];
                arr[i]= arr[j];
                arr[j]= temp;
            }
        }
    }
    for(i=0;i<sz;i++)
    {
        printf("%d\n",arr[i]);
    }

    // printf("delete value in exact position\n");
    // int position;
    // scanf("%d",&position);
    // for(i=position-1;i<sz-1;i++)
    // {
    //     arr[i]=arr[i+1];
    // }
    // printf("After deleting value:\n");
    // for(i=0;i<sz-1;i++)
    // {
    //     printf("%d\n",arr[i]);
    // }

    printf("Duplicate elements deleteing:\n");
    for (i = 0; i < sz; i++)
    {
        if (arr[i] == arr[i+1])
            printf("dup elements: %d\n", arr[i]);
    }

    for(i=0;i<sz;i++)
    {
        printf("%d\n",arr[i]);
    }

    // for(i=0;i<sz;i++)
    // {
    //     for(j=0;j<i;j++)
    //     {
    //         if(arr[i]==arr[j])
    //         {
    //             printf("%d\n",arr[i]);
    //         }
    //         else
    //             printf("%d\n",arr[i]);
    //     }
    // }
    // }
}
