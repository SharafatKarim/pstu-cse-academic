#include <bits/stdc++.h>
using namespace std;

void hanoi_stack(int n, char beg, char aux, char end) {
    stack<pair<int, vector<char>>> st;
    st.push({n, {beg, aux, end}});

    while (!st.empty()) {
        int n = st.top().first;
        char beg = st.top().second[0];
        char aux = st.top().second[1];
        char end = st.top().second[2];
        st.pop();
        if (n == 1) {
            cout << beg << " -> " << end << endl;
        } else {
            st.push({n-1, {aux, beg, end}});
            st.push({1, {beg, aux, end}});
            st.push({n-1, {beg, end, aux}});
        }
    }
}

int main() {
    hanoi_stack(3, 'A', 'B', 'C');
}
