#include <stdio.h>
#define month 8
#define day 16

int check_date_in_between(int m1, int d1, int m2, int d2)
{
    if (m1 <= month && m2 >= month || m1 >= month && m2 <= month)
        if (d1 <= day && d2 >= day || d1 >= day && d2 <= day)
            return 1;
    return 0;
}

int main()
{
    printf("%d", check_date_in_between(1, 21, 12, 12));
    return 0;
}
