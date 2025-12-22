#include <stdio.h>

int main() {
    int odd, even;
    scanf("%d %d", &odd, &even);

    if (odd == 0 || even == 0) {
        printf("NO\n");
        return 0;
    }

    if (odd <= even + 1 && even <= odd + 1) {
        printf("YES\n");
    } else {
        printf("NO\n");
    }

    return 0;
}

