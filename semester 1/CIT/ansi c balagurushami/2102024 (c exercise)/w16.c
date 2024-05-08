#include<stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main()
{
    intro();
    int total, hundred, fifty, tweenty, ten, five, two, one;
    printf("Input the amount:");
    scanf("%d", &total);
    hundred = total / 100;
    total %= 100;
    printf("%d Note(s) of 100.00\n", hundred);
    fifty = total / 50;
    total %= 50;
    printf("%d Note(s) of 50.00\n", fifty);
    tweenty = total / 20;
    total %= 20;
    printf("%d Note(s) of 20.00\n", tweenty);
    ten = total / 10;
    total %= 10;
    printf("%d Note(s) of 10.00\n", ten);
    five = total / 5;
    total %= 5;
    printf("%d Note(s) of 5.00\n", five);
    two = total / 2;
    total %= 2;
    printf("%d Note(s) of 2.00\n", two);
    one = total / 1;
    total %= 1;
    printf("%d Note(s) of 1.00\n", one);
    return 0;
}
