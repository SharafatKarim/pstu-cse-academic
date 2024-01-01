#include <stdio.h>

#define MAXVAL 50
#define COUNTER 11

// 43 65 51 27 79 11 56 61 82 09 25 36 07 49 55 63 74 81 49 37 40 49 16 75 87 91 33 24 58 78 65 56 76 67 45 54 36 63 12 21 73 49 51 19 39 49 68 93 85 59

int main()
{
    float value[MAXVAL];
    int i, low, high;
    int group[COUNTER]={0,0,0,0,0,0,0,0,0,0,0};

    for ( i = 0 ; i < MAXVAL ; i++ )
    {
        scanf("%f", &value[i]);
        ++group[ (int) (value[i])/10 ];
    }
    printf("\n");
    printf(" GROUP      RANGE       FREQUENCY\n");
    for (i = 0; i < COUNTER; i++ )
    {
        low = i * 10;
        if (i == 10)
            high = 100;
        else
            high = low + 9;
        printf(" %-6d %3d to %3d %18d\n", i+1, low, high, group[i]);
    }
}
