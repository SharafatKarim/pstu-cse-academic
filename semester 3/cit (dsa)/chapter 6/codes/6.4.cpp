#include<iostream>
#include <stack>
#include <queue>

using namespace std;

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

string toPostfix(queue<string> input_list) {
    stack<string> st;
    string postfix = "";
    input_list.push(")");
    while (!input_list.empty()) {
        string token = input_list.front();
        input_list.pop();
        if (token == "+" || token == "-" || token == "*" || token == "/" || token == "^") {
            if (!st.empty() && precendenceReturn(st.top()) > precendenceReturn(token)) {
                postfix += st.top();
                st.pop();
            }
            st.push(token);
        } else if (token == "(") {
            st.push(token);
        } else if (token == ")") {
            while (!st.empty()) {
                if (st.top() == "(") {st.pop(); break;}
                postfix += st.top();
                st.pop();
            }
        } else {
            postfix += token;
        }
    }
    return postfix;
}

int main() {
    // Well we can take input from the user in this way [OPTIONAL]
    // -------------------------------------------------------------------
    // string input;
    // // cin >> input; // If there is space in input this line won't gonna work
    // getline(cin, input); // Taking whole line as input
    // queue<string> input_list;
    // string temp_string = "";
    // for (int i = 0; i < input.size(); i++) {
    //     if (input[i] == ' ') continue; // Avoiding spaces
    //     if (isdigit(input[i])) temp_string += input[i];
    //     else { 
    //         if(!temp_string.empty()) input_list.push(temp_string); 
    //         temp_string = ""; 
    //         input_list.push(string(1, input[i]));
    //     }
    // }
    // if(!temp_string.empty()) input_list.push(temp_string); 

    // The following lines are to print the queue (input list)
    // But the queue will be empty later on [WARNING]
    // while (input_list.size()) {
    //     cout << input_list.front() << " ";
    //     input_list.pop();
    // }

    // Or, We can Directly initialize our queue in this way [OPTIONAL]
    // -------------------------------------------------------------------
    queue<string> input_list({"A","+","(","B","*","C","-","(","D","/","E","^","F",")","*","G",")","*","H"});
    // queue<string> input_list({"A","+","B"}); // Simpler one!
    
    // Finally we can call our function toPostfix
    // -------------------------------------------------------------------
    cout << toPostfix(input_list) << "\n";
    
    return 0;
}