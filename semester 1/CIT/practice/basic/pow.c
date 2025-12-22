#include<stdio.h>
#include<math.h>
int main()
{
   int a,b,c,d;
   scanf("%d %d %d %d",&a,&b,&c,&d) ;
    // printf("1st -> %f\n", pow(a,b));
    // printf("2nd -> %f\n", pow(c,d));

    if (a == c && b > d && a != 1)
    printf("YES");
    else if (a == c && b <= d)
    printf("NO");

    else if (a > c && b == d)
    printf("YES");
    else if (a <= c && b == d)
    printf("NO");

   else if(pow(a,b)>pow(c,d))
    printf("YES");
   else if(pow(a,b) == pow(c,d) || pow(a,b)<pow(c,d))
    printf("NO");
   return 0;
}

/*
#include<stdio.h>
#include<math.h>
int main()
{
   int a,b,c,d;
   scanf("%d%d%d%d",&a,&b,&c,&d) ;
   if(pow(a,b)>pow(c,d))
    printf("YES");
   else if(pow(a,b)== pow(c,d) || pow(a,b)<pow(c,d))
    printf("NO");
   return 0;
}*/
