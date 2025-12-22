// C program for generating a
// random number in a given range.
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Generates and prints 'count' random
// numbers in range [lower, upper].
void printRandoms(int lower, int upper,
							int count)
{
	int i;
	for (i = 0; i < count; i++) {
        // int num = (rand() %
		// (upper - lower + 1)) + lower;

        int num = rand() % upper;
		printf("%d " ,num);
    }
}

// Driver code
int main()
{
	int lower = 5, upper = 10, count = 100;

	// Use current time as
	// seed for random generator
	srand(time(0));

	printRandoms(lower, upper, count);

	return 0;
}
