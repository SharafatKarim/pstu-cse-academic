#include <stdio.h>
#include <string.h>
int main()
{

    char str[3][35], tmp[34];
    printf("ENter 3 word\n");
    for (int i = 0; i < 3; i++) {

        scanf("%s", str[i]);
    }
    for (int i = 0; i < 3; i++) {

        for (int j = i + 1; j < 3; j++) {

            if (strcmp(str[i], str[j]) > 0) {
                strcpy(tmp, str[i]);
                strcpy(str[i], str[j]);
                strcpy(str[j], tmp);
            }
        }
    }
    printf("\nIn the lexicographical order :\n");
    for (int i = 0; i < 3; i++) {
        // puts(str[i]);

        printf("%s ", str[i]);
    }
    return 0;
}
