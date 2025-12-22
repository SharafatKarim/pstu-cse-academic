#include <stdio.h>
int main()
{
    int n = 4, sz = 4, i;
    int arr[4] = {1, 2, 3, 4};
    printf("Cyclically Permute the Elements of an Array\n");
    arr[n]=arr[0];
    printf("last %d", arr[n]);
   for(i=0;i<sz;i++)
   {
       arr[i]=arr[i+1];
   }
   for(i=0;i<sz;i++)
   {
       printf("%d\n",arr[i]);
   }

}
