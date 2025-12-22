#include <stdio.h>

int main()
{
    union u {
        int a;
        int b;
    } un;
    union u test = { 5 };
    printf("%d", test.b);
}
