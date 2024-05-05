#include <iostream>
#include <math.h>
using namespace std;

int main()
{
    int A, B, C;
    cin >> A >> B >> C;
    int D = B * B - 4 * A * C;
    if (D > 0)
    {
        float X1 = (-B + sqrt(D)) / (2 * A);
        float X2 = (-B - sqrt(D)) / (2 * A);
        cout << X1 << " and " << X2 << "\n";
    }
    else if (D == 0)
    {
        float X = -B / 2 * A;
        cout << "UNIQUE SOLUTION : " << X << "\n";
    }
    else 
    {
        cout << "NO REAL SOLUTIONS" << "\n";
    }
    return 0;
}
