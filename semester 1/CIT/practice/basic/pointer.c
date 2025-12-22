// // codeforces 443A Anton and Letters
// // #include "stdio.h"
// #include <ctype.h>
// #include <stdio.h>
// #include <string.h>
//
// int main()
// {
//     char input[1000]; // to store input characters
//     int storage[128]; // to take count of individual characters
//     int ascii = 0, i, count = 0;
//
//     for (i = 0; i < 1000; i++) {
//         input[i] = '\0'; // replace every cell of the array with null character
//     }
//
//     for (i = 0; i < 128; i++) {
//         storage[i] = 0; // make everything zero in storge[]
//         // printf("%d ",storage[i]); // init with garbage value
//     }
//     // I haven't learned pointers yet
//     scanf("%[^\n]", input); // getting input
//
//     for (i = 0; i < 1000; i++) {
//         ascii = toascii(input[i]); // converting each character to equivalent ascii value
//         // printf("ASCII=%d ", ascii);
//         // printf("-- %c --\n", input[i]);
//         if (ascii > 96 && ascii < 123) {
//             storage[ascii] = 1;
//             printf("-- %d --\n", i);
//         }
//         // else {
//         // storage[ascii] = 0;
//         // }
//     }
//     for (i = 0; i < 128; i++) {
//         if (storage[i] == 1) {
//             count++;
//         }
//     }
//     printf("%d", count);
//
//     return 0;
// }

// codeforces 443A Anton and Letters
#include "stdio.h"
#include <ctype.h>
#include <string.h>

int main()
{
    char input[1000]; // to store input characters
    int storage[128]; // to take count of individual characters
    int ascii = 0, i, count = 0;

    for (i = 0; i < 1000; i++) {
        input[i] = '\0'; // replace every cell of the array with null character
    }

    for (i = 0; i < 128; i++) {
        storage[i] = 0; // make everything zero in storge[]
        // printf("%d ",storage[i]); // init with garbage value
    }
    // I haven't learned pointers yet
    scanf("%[^\n]", input); // getting input

    for (i = 0; i < 1000; i++) {
        ascii = toascii(input[i]); // converting each character to equivalent ascii value
        // printf("ASCII=%d ", ascii);
        if (ascii > 96 && ascii < 123) {
            storage[ascii] = 1;
        } else {
            storage[ascii] = 0;
        }
    }
    for (i = 0; i < 128; i++) {
        if (storage[i] == 1) {
            count++;
        }
    }
    printf("%d", count);

    return 0;
}
