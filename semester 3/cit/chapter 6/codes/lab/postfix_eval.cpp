#include <bits/stdc++.h>
#include <ctime>
#include <string>

using namespace std;

void postfixEval(string str) {
    vector<string> main;

    string temp = "";
    for (auto i: str) {
        if (i == ' ') {
            main.push_back(temp);
            temp = "";
            continue;        }
            temp += i;
    }
    main.push_back(temp);

    stack<string> st;
    for (auto i: main) {
        cout << i << endl;
        if (i == "+") {
            int b = stoi(st.top());
            st.pop();

            int a = stoi(st.top());
            st.pop();

            st.push(to_string(a + b));
        } else if (i == "-") {
            int b = stoi(st.top());
            st.pop();

            int a = stoi(st.top());
            st.pop();

            st.push(to_string(a - b));
        } else if (i == "*") {
            int b = stoi(st.top());
            st.pop();

            int a = stoi(st.top());
            st.pop();

            st.push(to_string(a * b));
        } else if (i == "/") {
            int b = stoi(st.top());
            st.pop();

            int a = stoi(st.top());
            st.pop();

            st.push(to_string(a / b));
        } else
            st.push(i);
    }

    cout << st.top();
}

string toPostfix(string str) {
    vector<string> main;

    string temp = "";
    for (auto i: str) {
        if (i == ' ') {
            main.push_back(temp);
            temp = "";
            continue;        }
            temp += i;
    }
    main.push_back(temp);

    stack<string> st;
    string exp = "";
    for (auto i: main) {
        if (i == "+") {

        } else if (i == ")") {
            string temp = st.top();
            st.pop();
            while (temp == "(") {
                exp += temp;
            }
        } else if (i == "(") {
            st.push(i);
        }
        else
            st.push(i);
    }

    return "";
}

int main() {
    string str;
    // str = "5 2 1 + +";
    str = "5 6 2 + * 12 4 / -";

    postfixEval(str);
    return 0;
}
