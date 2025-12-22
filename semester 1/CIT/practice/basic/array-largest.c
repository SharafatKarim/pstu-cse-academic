#include <stdio.h>

int main()
{
    int array[6] = {1, 2, 3, 4, 5, 6};
    // declared an array

    int temporary, temporary2;
    temporary = 0;
    // I took two temporary variable cause I need to find the second largest number!

    // Here's a loop which will iterate over every single values of array elements
    int i;
    for (; i<6; i++)
    {
        if ( temporary < array[i] )
        {
            temporary2 = temporary;
            temporary = array[i];
        }
    }

    // finally I'll print
    printf("first largest -> %d\n", temporary);
    printf("second largest -> %d\n", temporary2);
}
