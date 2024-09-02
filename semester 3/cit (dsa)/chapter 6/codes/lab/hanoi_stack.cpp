#include <bits/stdc++.h>
#include <utility>
#include <vector>
using namespace std;

void hanoi_stack(int n, char beg, char aux, char end) {
    stack<pair<int, vector<char>>> st;
    pair<int, vector<char>> pa;
    pa.first = n;
    pa.second.push_back(beg);
    pa.second.push_back(aux);
    pa.second.push_back(end);
    st.push(pa);
    pa.second.clear();

    while (!st.empty()) {
        int n = st.top().first;
        char beg = st.top().second[0];
        char aux = st.top().second[1];
        char end = st.top().second[2];
        st.pop();
        if (n == 1) {
            cout << beg << " -> " << end << endl;
        } else {
            pa.first = n - 1;
            pa.second.push_back(aux);
            pa.second.push_back(beg);
            pa.second.push_back(end);
            st.push(pa);
            pa.second.clear();

            pa.first = 1;
            pa.second.push_back(beg);
            pa.second.push_back(aux);
            pa.second.push_back(end);
            st.push(pa);
            pa.second.clear();

            pa.first = n - 1;
            pa.second.push_back(beg);
            pa.second.push_back(end);
            pa.second.push_back(aux);
            st.push(pa);
            pa.second.clear();
        }
    }
}

int main() {
    hanoi_stack(3, 'A', 'B', 'C');
}
