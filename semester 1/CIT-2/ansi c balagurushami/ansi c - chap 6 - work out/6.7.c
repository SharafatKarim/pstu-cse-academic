#include <stdio.h>
#define MAX 50000

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main()
{
    intro();
    
    long int loan1, loan2, loan3, sancloan, sum23;
    printf("Enter the values of previous two loans:\n");
    scanf("%ld %ld", &loan1, &loan2);
    printf("Enter the new value of new loan:\n");
    scanf("%ld", &loan3);
    sum23 = loan2 + loan3;
    sancloan = (loan1 >0) ? 0: (sum23 > MAX)? MAX - loan2: loan3;
    printf("\n");
    printf("Previous loans pending:\n%d %d\n", loan1, loan2);
    printf("Loan requested = %d\n", loan3);
    printf("Loan sanctioned = %d\n", sancloan);
}