#include <stdio.h>

int main() {
    long long n, k;
    scanf("%lld %lld", &n, &k);
    
    long long m = (n + 1) / 2; // largest odd integer less than or equal to n
    
    if (k <= m) {
        printf("%lld\n", 2 * k - 1); // kth number is an odd number
    } else {
        printf("%lld\n", 2 * (k - m)); // kth number is an even number
    }
    
    return 0;
}