#include<iostream>
#include <stack>
#include <queue>

using namespace std;

string toPostfix(queue<string> input_list) {
    stack<string> st;
    string postfix = "";
    while (!input_list.empty()) {
        string token = input_list.front();
        input_list.pop();
        if (token == "+" || token == "-" || token == "*" || token == "/" || token == "^") {
            st.push(token);
        } else if (token == "(") {
            st.push(token);
        } else if (token == ")") {
            while (st.top() != "(") {
                postfix += st.top();
                st.pop();
            }
            st.pop();
        } else {
            postfix += token;
        }
    }
    return postfix;
}

int main() {
    string input;
    cin >> input;
    queue<string> input_list;
    for (int i = 0; i < input.size(); i++) {
        // input_list.push(string(1, input[i]));
        if (input[i] == '+' || input[i] == '-' || input[i] == '*' || input[i] == '/' || input[i] == '^' || input[i] == '(' || input[i] == ')') {
            input_list.push(string(1, input[i]));
        } else {
            string operand = "";
            while (input[i] >= 'A' && input[i] <= 'Z') {
                operand += input[i];
                i++;
            }
            i--;
            input_list.push(operand);
        }
    }
    // queue<string> input_list({"A","+","(","B","*","C","-","(","D","/","E","^","F",")","*","G",")","*","H"});
    // queue<string> input_list({"A","+","B"});
    cout << toPostfix(input_list) << "\n";
    return 0;
}