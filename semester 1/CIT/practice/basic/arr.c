/*
    ======================
    NAYEEEMA (not NAYEMA) FERDOUSHI
    PSTU CSE-19
    2102026
    ===================
*/

#include <stdio.h>
#include <string.h>

int main()
{

    char str[(long unsigned)10e5];
    scanf("%[^\n]", str);

    int len = strlen(str);

    for (int i = 0; i < len; i++) {
        if (str[i] == '\\')
            break;
        printf("%c", str[i]);
    }
}
