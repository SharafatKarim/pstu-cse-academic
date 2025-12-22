#include <iostream>
#include <stdio.h>
#include <stdlib.h>
using namespace std;

int main()
{
    int h, m;
    cin >> h >> m;

    float h_a = (float) 360 * h / 12 + (float) 30 * m / 60;
    float m_a = (float) 360 * m / 60;
    printf("%0.4f", ((abs(h_a-m_a) > 180.0) ? (360 - abs(h_a-m_a)) : abs(h_a-m_a)));
}
