#include<iostream>
using namespace std;

int searchPattern(string str, string pattern) {
    int pattern_length = pattern.length();
    int string_length = str.length();

    for (int i=0; i <= string_length - pattern_length; i++) {
        for (int j=0; j <pattern_length; j++) {
            if (str[i+j] != pattern[j]) {
                break;
            } else if (j == pattern_length - 1) {
                return i;
            }
        }
    }
    return -1;
}

string eraseABit(string str, int index, int pattern_length) {
    string temp = "";
    int length = str.length();

    for (int i=0; i <length; i++) {
        if (index <= i && i <= index+pattern_length-1) {
            continue;
        }
        temp += str[i];
    }

    return temp;
}

int main()
{
    string str = "To be or not 2B, that is the B,?";
    string pattern = "B,";

    int index = searchPattern(str, pattern);

    while (index != -1)
    {
        str = eraseABit(str, index, pattern.length());
        index = searchPattern(str, pattern);
    }

    cout << str << endl;
}
