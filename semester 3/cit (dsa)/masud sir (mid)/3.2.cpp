#include<iostream>
using namespace std;

int main()
{
    // this algorithm replaces every occurrence of pattern from str with placeholder
    string str;
    cout << "your string : " << endl;
    getline(cin, str);
    // string pattern = "B,";
    string pattern;
    cout << "your pattern: " << endl;
    cin >> pattern;
    string placeholder;
    cout << "your placeholder : " << endl;
    cin >>placeholder;

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
