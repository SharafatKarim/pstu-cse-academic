#include<stdio.h>
int main()
{
    int sz1,sz2,i,j,rsum[sz1],csum[sz2];
    scanf("%d%d",&sz1,&sz2);
    int arr[sz1][sz2];
    for(i=0;i<sz1;i++)
    {
        for(j=0;j<sz2;j++)
        {
            printf("arr[%d][%d] :",i,j);
            scanf("%d",&arr[i][j]);
        }
        printf("\n");
    }
    printf("the matrix is:\n");
    for(i=0;i<sz1;i++)
    {
        for(j=0;j<sz2;j++)
        {
            printf("%d ",arr[i][j]);
        }
        printf("\n");
    }
   /*sum of rows*/
    for(i=0;i<sz1;i++)
    {
        rsum[i]=0;
        for(j=0;j<sz2;j++)
        {
            rsum[i]+=arr[i][j];
        }
    }
    /*Sum of Column*/
    for(i=0;i<sz1;i++)
    {
        csum[i]=0;
        {
            for(j=0;j<sz2;j++)
            {
                csum[i]+=arr[j][i];
            }
        }
    }
    printf("The Sum or rows and columns of the matrix is :\n");
    for(i=0;i<sz1;i++)
    {
        for(j=0;j<sz2;j++)
        {
            printf(" %4d",arr[i][j]);
            //printf("%8d",rsum[i]);
        }
         printf("%8d",rsum[i]);
         printf("\n");
    }
for(i=0;i<sz1;i++)
{
       for(j=0;j<sz2;j++)
           printf("%4d",csum[j]);
    }
}
