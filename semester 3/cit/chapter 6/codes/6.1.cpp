#include<iostream>
#include <stack>

using namespace std;

void stack_push_stl() {
    stack<int> st;
    st.push(5);
    cout << st.top() << "\n";
}

int main() {
    stack_push_stl();
    return 0;
}
