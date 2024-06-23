#include<iostream>
#include <stack>
#include <queue>

using namespace std;

string solvePostfix_1(queue<string> input_list) {
    stack<string> st;
    while (!input_list.empty()) {
        string token = input_list.front();
        input_list.pop();
        if (token == "+" || token == "-" || token == "*" || token == "/") {
            string operand2 = st.top();
            st.pop();
            string operand1 = st.top();
            st.pop();
            if (token == "+") {
                st.push(to_string(stoi(operand1) + stoi(operand2)));
            } else if (token == "-") {
                st.push(to_string(stoi(operand1) - stoi(operand2)));
            } else if (token == "*") {
                st.push(to_string(stoi(operand1) * stoi(operand2)));
            } else if (token == "/") {
                st.push(to_string(stoi(operand1) / stoi(operand2)));
            }
        } else {
            st.push(token);
        }
    }
    return st.top();
}

string solvePostfix_2(queue<string> input_list) {
    stack<string> st;
    int first_operator, second_operator;
    while (!input_list.empty()){
        switch (input_list.front().at(0))
        {
        case '+':
            second_operator = stoi(st.top()); st.pop();
            first_operator = stoi(st.top()); st.pop();
            st.push(to_string( first_operator + second_operator ));
            break;
        
        case '-':
            second_operator = stoi(st.top()); st.pop();
            first_operator = stoi(st.top()); st.pop();
            st.push(to_string( first_operator - second_operator ));
            break;
        
        case '*':
            second_operator = stoi(st.top()); st.pop();
            first_operator = stoi(st.top()); st.pop();
            st.push(to_string( first_operator * second_operator ));
            break;
        
        case '/':
            second_operator = stoi(st.top()); st.pop();
            first_operator = stoi(st.top()); st.pop();
            st.push(to_string( first_operator / second_operator ));
            break;
        
        default:
            st.push(input_list.front());
            break;
        }
        input_list.pop();
    }
    return st.top();
}

int main() {
    queue<string> input_list({"5","6","2","+","*","12","4","/","-"});
    cout << solvePostfix_1(input_list) << "\n";
    cout << solvePostfix_2(input_list) << "\n";
    return 0;
}