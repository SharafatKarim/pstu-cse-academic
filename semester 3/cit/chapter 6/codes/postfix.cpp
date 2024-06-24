#include<iostream>
#include <stack>
#include <queue>
#include <math.h>

using namespace std;

string solvePostfix(queue<string> input_list) {
    stack<string> st;
    while (!input_list.empty()) {
        string token = input_list.front();
        input_list.pop();
        if (token == "+" || token == "-" || token == "*" || token == "/" || token == "^") {
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
            } else if (token == "^") {
                st.push(to_string(pow(stoi(operand1), stoi(operand2))));
            }
        } else {
            st.push(token);
        }
    }
    return st.top();
}

int precendenceReturn(string str) {
    switch (str.at(0))
    {
    case '+':
        return 1;
        break;
    case '-':
        return 1;
        break;
    case '*':
        return 2;
        break;
    case '/':
        return 2;
        break;
    case '^':
        return 3;
        break;
    default:
        return 0;
        break;
    }
}

queue<string> toPostfix(queue<string> input_list) {
    stack<string> st;
    queue<string> postfix;
    input_list.push(")");
    while (!input_list.empty()) {
        string token = input_list.front();
        input_list.pop();
        if (token == "+" || token == "-" || token == "*" || token == "/" || token == "^") {
            if (!st.empty() && precendenceReturn(st.top()) > precendenceReturn(token)) {
                postfix.push(st.top());
                st.pop();
            }
            st.push(token);
        } else if (token == "(") {
            st.push(token);
        } else if (token == ")") {
            while (!st.empty()) {
                if (st.top() == "(") {st.pop(); break;}
                postfix.push(st.top());
                st.pop();
            }
        } else {
            postfix.push(token);
        }
    }
    return postfix;
}

// // Debugging purpose
// void printQueue(queue<string> input_list) {
//     while (!input_list.empty()) {
//         cout << " <-" << input_list.front() << "-> ";
//         // cout << input_list.front();
//         input_list.pop();
//     }
// }

int main() {
    // Well we can take input from the user in this way [OPTIONAL]
    // -------------------------------------------------------------------
    string input;
    // cin >> input; // If there is space in input this line won't gonna work
    getline(cin, input); // Taking whole line as input
    queue<string> input_list;
    string temp_string = "";
    for (int i = 0; i < input.size(); i++) {
        if (input[i] == ' ') continue; // Avoiding spaces
        if (isdigit(input[i])) temp_string += input[i];
        else { 
            if(!temp_string.empty()) input_list.push(temp_string); 
            temp_string = ""; 
            input_list.push(string(1, input[i]));
        }
    }
    if(!temp_string.empty()) input_list.push(temp_string); 

    // The following lines are to print the queue (input list)
    // But the queue will be empty later on [WARNING]
    // while (input_list.size()) {
    //     cout << input_list.front() << " ";
    //     input_list.pop();
    // }

    // Or, We can Directly initialize our queue in this way [OPTIONAL]
    // -------------------------------------------------------------------
    // queue<string> input_list({"A","+","(","B","*","C","-","(","D","/","E","^","F",")","*","G",")","*","H"});
    // queue<string> input_list({"A","+","B"}); // Simpler one!
    
    // Finally we can call our function solvePostfix and toPostfix
    // -------------------------------------------------------------------
    cout << solvePostfix(toPostfix(input_list)) << "\n";
    
    return 0;
}