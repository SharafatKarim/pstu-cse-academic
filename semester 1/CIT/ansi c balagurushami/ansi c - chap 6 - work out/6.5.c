#include <stdio.h>

void intro(void)
{
    printf("Name: Sharafat\n");
    printf("Id  : 2102024\n");
}

int main()
{
    intro();

    int units, custom;
    float charges;
    printf("Enter CUSTOMER NO. and UNITS consumed\n");
    scanf("%d %d", &custom, &units);
    if (units <= 200)
        charges = 0.5 * units;
    else if (units <= 400)
        charges = 100 + 0.65 * (units - 200);
    else if (units <= 400)
        charges = 230 + 0.8 * (units - 200);
    else
        charges = 390 + (units - 600);

    printf("\n\nCustomer No: %d: Charges = %.2f\n",
           custom, charges);
}