#include<stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}


int main()
{
    intro();

    int a, b, c, d;
    float ratio;
    printf("Enter 4 integers:\n");
    scanf("%d %d %d %d", &a, &b, &c, &d);
    if (c-d != 0)
    {
        // ratio = (float) (a+b) / (float) (a-b);
        // ratio = (a+b) / (a-b);
        ratio = (a+b) / (a-b);
        printf("Ratio = %lf", ratio );
    }
}