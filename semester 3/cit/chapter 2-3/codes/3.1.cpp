#include<iostream>
using namespace std;

int main()
{
    // this algorithm deletes every occurrence of pattern from str
    string str = "To be or not 2B, that is the ?";
    string pattern = "B,";

    int index = str.find(pattern);
    while (index != -1)
    {
        str.erase(index, pattern.length());
        index = str.find(pattern);
    }

    cout << str << endl;    
}