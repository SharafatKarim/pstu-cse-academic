#include<stdio.h>
int main()
{
    float num;
    scanf("%f", &num);

    printf("Smallest integer = %d\n", (int)num - 1);
    printf("Largest integer = %d\n", (int)num + 1);
    printf("Given number = %f\n", num);
}