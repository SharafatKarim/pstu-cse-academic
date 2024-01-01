#include <stdio.h>
#define MAX_VAL 10

// 1.1 2.2 3.3 4.4 5.5 6.6 7.7 8.8 9.9 10.10
int main()
{
    float num[MAX_VAL], sum=0;
    int i;
    for (i=0; i<MAX_VAL; i++)
        scanf("%f", &num[i]);
    for (i=0; i<MAX_VAL; i++)
    {
        printf("x[%2d] = %f\n", i+1,num[i]);
        sum += num[i] * num[i];
    }
    printf("\n");
    printf("Total = %f", sum);
}
