#include<iostream>
#include<stack>
using namespace std;

void towerOfHanoi(int n, char beg, char aux, char end) {
    if (n==1) {
        cout << beg << " -> " << end << "\n";
        return;
    }
    stack<char> st_beg, st_aux, st_end;
    stack<int> st_n;
    
    while (true) {
        if (n==1) {
            if (st_beg.empty()) return;
            cout << "(" << n << ")- " << beg << " -> " << end << "\n";
            beg = st_beg.top();
            aux = st_aux.top();
            end = st_end.top();
            st_beg.pop(), st_aux.pop(), st_end.pop();
        }
        if (n != 1) {
            st_beg.push(beg), st_aux.push(aux), st_end.push(end);
            st_n.push(n);
            beg = st_beg.top();
            aux = st_end.top();
            end = st_aux.top();
            n--;
            // continue;
        }
        cout << beg << " -> " << end << "\n";
        if (n != 1) {
            st_beg.push(beg), st_aux.push(aux), st_end.push(end);
            st_n.push(n);
            beg = st_aux.top();
            aux = st_beg.top();
            end = st_end.top();
            n--;
            // continue;
        }
    }

    // towerOfHanoi(n-1, beg, end, aux);
    // towerOfHanoi(1, beg, aux, end);
    // towerOfHanoi(n-1, aux, beg, end);
}

int main() {
    towerOfHanoi(4, 'A', 'B', 'C');
}