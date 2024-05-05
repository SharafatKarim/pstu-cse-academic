#include <iostream>
using namespace std;

void LinearSearch(int DATA[], int N, int ITEM)
{
    int K = 0, LOC = -1;
    while (LOC == -1 && K < N)
    {
        if (ITEM == DATA[K])
            LOC = K;
        K = K + 1;
    }
    if (LOC == -1)
        cout << "ITEM is not on the array DATA\n";
    else
        cout << LOC << " is the location of ITEM\n";
    return;
}

int main()
{
    int DATA[] = {3, 5, 9, 2};
    int N = sizeof(DATA) / sizeof(int);
    int ITEM = 9;
    LinearSearch(DATA, N, ITEM);
    return 0;
}
