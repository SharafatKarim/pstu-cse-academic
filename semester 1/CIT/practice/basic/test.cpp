#include <stdio.h>
int fun1(int* a);
int main()
{
    int a = 10;
    a = fun1(&a);
    printf("%d", a);
}
int fun1(int* a)
{
    int b = 9;
    b = *a + b;
    return b;
}
