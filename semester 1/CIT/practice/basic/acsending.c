#include<stdio.h>
void swap(int *a, int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

int main()
{
    int A,B,C;

    scanf("%d %d %d",&A,&B,&C);

    if (A>B)
    {
        swap(&A,&B);
    }
    if (A>C)
    {
        swap(&A,&C);
    }
    if (B>C)
    {
        swap(&B,&C);
    }

    printf("%d %d %d\n",A,B,C);

    // printf("%d\n%d\n%d\n",A,B,C);

    return 0;
}
