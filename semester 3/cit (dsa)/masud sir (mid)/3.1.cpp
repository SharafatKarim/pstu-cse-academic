#include<iostream>
using namespace std;

int main()
{
    // this algorithm deletes every occurrence of pattern from str
    // string str = "To be or not 2B, that is the ?";
    string str;
    cout << "enter string: " << endl;
    getline(cin, str);
    // string pattern = "B,";
    string pattern;
    cout << "enter pattern: " << endl;
    cin >> pattern;

    int index = str.find(pattern);
    while (index != -1)
    {
        str.erase(index, pattern.length());
        index = str.find(pattern);
    }

    cout << str << endl;    
}
