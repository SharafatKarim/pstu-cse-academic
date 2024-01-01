#include<stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}


int main()
{
    intro();

    int count, i;
    float weight, height;

    count = 0;
    printf("Enter weight and height of 10 boys:\n");

    for (i = 0; i < 10; i++)
    {
        scanf("%f %f", &weight, &height);
        if (weight < 50 && height > 170)
        {
            count++;
        }
        
    }
    printf("Num of boys with weight < 50 and height > 170\n");
    printf("%d", count);
}