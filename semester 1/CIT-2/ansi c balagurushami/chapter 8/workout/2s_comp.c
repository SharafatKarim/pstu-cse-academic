#include <stdio.h>
#include <string.h>

int main()
{
    char a[16];
    scanf("%s", a);

    int len = strlen(a);
    // printf("%d", len);

    int i, j;

    for (i=len-1; a[i]!='1';i--);

        for (j=i-1;j>=0;j--)
        {
            if (a[j]=='1')
                a[j] = '0';
            else
                a[j] = '1';
        }
        printf("%s", a);
}
