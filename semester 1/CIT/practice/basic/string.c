#include <stdio.h>
#include <string.h>
int main()
{
    char txt[6543];
    scanf("%[^\n] ", txt);
    char ch;
    // int count=0;
    scanf("%c", &ch);
    int count = 0;
    for (int i = 0; txt[i] != '\0'; i++) {
        if (txt[i] == ch)
            ++count;
    }
    printf("%d", count);
}
