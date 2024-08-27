#include <bits/stdc++.h>

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
    if (temp  != "") main.push_back(temp);

    stack<string> st;
    for (auto i: main) {
        cout << "->" << i << endl;
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

int precendenceReturn(string a) {
    if (a == "+" || a == "-") {
        return 1;
    } else if (a == "*" || a == "/") {
        return 2;
    } else if (a == "^") {
        return 3;
    } else {
        return 0;
    }
}

bool precedenceCheck(string a, string b) {
    return precendenceReturn(a) > precendenceReturn(b);
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
    main.push_back(")");

    stack<string> st;
    st.push("(");
    string exp = "";
    for (auto i: main) {
        if (i == "(") {
            st.push(i);
        } else if (i == "+" || i == "-" || i == "*" || i == "/" || i == "^") {
            if (precedenceCheck(st.top(), i)) {
                exp += st.top() + " ";
                st.pop();
                st.push(i);
            } else {
                st.push(i);
            }
        } else if (i == ")") {
            while (st.top() != "(") {
                exp += st.top() + " ";
                st.pop();
            } st.pop();
        } else
            exp += i + " ";
    }

    return exp;
}

int main() {
    string str;
    str = "1 + 5 * 6 - 1";
    postfixEval(toPostfix(str));
    // postfixEval("5 6 7 + + ");
    return 0;
}
