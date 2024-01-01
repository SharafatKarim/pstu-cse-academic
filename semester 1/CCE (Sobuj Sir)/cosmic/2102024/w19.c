// Write a C program that accepts 4 integers p, q, r, s from the user where q, r and s are positive and p is even. If q is greater than r and s is greater than p and if the sum of r and s is greater than the sum of p and q print "Correct values", otherwise print "Wrong values".

#include <stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main()
{
    intro();
    int p, q, r, s;
    printf("\nInput the first integer: ");
    scanf("%d", &p);
    printf("\nInput the second integer: ");
    scanf("%d", &q);
    printf("\nInput the third integer: ");
    scanf("%d", &r);
    printf("\nInput the fourth integer: ");
    scanf("%d", &s);
    if (q > 0 && r > 0 && s > 0 && (p % 2) == 0 && q > r && s > p && (r + s) > (p + q))
        printf("Correct values");
    else
        printf("Correct values");
    return 0;
}