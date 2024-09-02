#include<iostream>
#include <stack>

using namespace std;

void stack_pop_stl() {
    stack<int> st;
    st.push(5);
    st.push(3);
    while (!st.empty()) {
        cout << "-> " << st.top() << "\n";
        st.pop();
    }
}

int main() {
    stack_pop_stl();
    return 0;
}
