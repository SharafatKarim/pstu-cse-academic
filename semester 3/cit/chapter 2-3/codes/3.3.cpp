#include <iostream>
using namespace std;

int patternMatching(string str, int str_len, string pattern, int pattern_len)
{
    if (pattern_len > str_len)
        return -1;

    int k = 0, max = str_len - pattern_len + 1;
    while (k < max)
    {
        for (int l = 0; l < pattern_len; l++)
        {
            if (pattern[l] != str[l + k])
                break;
            if (l + 1 == pattern_len)
                return k;
        }
        k++;
    }
    return -1;
}

int main()
{
    string str = "To be or not 2B, that is the ?";
    string pattern = "B,";
    int index = patternMatching(str, str.length(), pattern, pattern.length());
    cout << "Index is : " << index << endl;
    return 0;
}
