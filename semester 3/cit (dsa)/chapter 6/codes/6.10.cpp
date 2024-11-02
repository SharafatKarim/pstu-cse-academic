#include<iostream>
#include<stack>
using namespace std;

void towerOfHanoi(int n, char beg, char aux, char end) {
    int add = 2;
    stack<char> st_beg, st_aux, st_end;
    stack<int> st_n, st_add;
    
    while (true) {
        if (n == 1) {
            cout << beg << " -> " << end << "\n";
            add = 5;
        }
        if (add == 2) {
            st_beg.push(beg), st_aux.push(aux), st_end.push(end);
            st_n.push(n), st_add.push(3);
            beg = st_beg.top();
            aux = st_end.top();
            end = st_aux.top();
            n--;
        }
        if (add == 3) {
            cout << beg << " -> " << end << "\n";
            st_beg.push(beg), st_aux.push(aux), st_end.push(end);
            st_n.push(n), st_add.push(5);
            beg = st_aux.top();
            aux = st_beg.top();
            end = st_end.top();
            n--;
            add = 2;
        }
        if (add == 5) {
            if (st_beg.empty()) return;
            beg = st_beg.top();
            aux = st_aux.top();
            end = st_end.top();
            n = st_n.top();
            add = st_add.top();
            st_beg.pop(), st_aux.pop(), st_end.pop(); 
            st_add.pop(), st_n.pop();
        }
    }
}

int main() {
    towerOfHanoi(20, 'A', 'B', 'C');
}
