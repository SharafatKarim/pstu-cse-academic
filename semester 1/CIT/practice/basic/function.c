#include <stdbool.h>
#include <stdio.h>

extern int a;
void test(int);

int main()
{
    register int b;
    a++;
    test(a);
    printf("\n -> %d", a);
}

bool b;

void test(int a)
{
    printf("%d", ++a);
}

int a;
