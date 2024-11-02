#include<iostream>
using namespace std;

int main()
{
    // this algorithm replaces every occurrence of pattern from str with placeholder
    string str = "To be or not 2B, that is the ? that is 2B decided for future!";
    string pattern = "2B";
    string placeholder = "to be";

    int index = str.find(pattern);
    while (index != -1)
    {
        // str.replace(index, pattern.length(), placeholder);
        str.erase(index, pattern.length());
        str.insert(index, placeholder);
        index = str.find(pattern);
    }

    cout << str << endl;    
}
