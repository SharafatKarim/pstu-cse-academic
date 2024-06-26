#include<iostream>
#include<stack>
using namespace std;

void towerOfHanoi(int n, char beg, char aux, char end) {
    if (n==1) {
        cout << beg << " -> " << end << "\n";
        return;
    }
    int add = 2;
    stack<char> st_beg, st_aux, st_end;
    stack<int> st_n, st_add;
    
    while (true) {
        if (n==1) {
            cout << "(" << n << ")- " << beg << " -> " << end << "\n";
            // add = 5;
        }
        if (add != 3) {
            st_beg.push(beg), st_aux.push(aux), st_end.push(end);
            st_add.push(3);
            st_n.push(n);
            beg = st_beg.top();
            aux = st_end.top();
            end = st_aux.top();
            n--;
            // continue;
        }
        if (add == 3) {
            cout << beg << " -> " << end << "\n";
            st_beg.push(beg), st_aux.push(aux), st_end.push(end);
            st_add.push(5);
            st_n.push(n);
            beg = st_aux.top();
            aux = st_beg.top();
            end = st_end.top();
            n--;
            add = 2;
            // continue;
        }
        if (n == 1 || add == 5) {
            if (st_beg.empty()) return;
            beg = st_beg.top();
            aux = st_aux.top();
            end = st_end.top();
            add = st_add.top();
            st_beg.pop(), st_aux.pop(), st_end.pop();
        }
    }

    // towerOfHanoi(n-1, beg, end, aux);
    // towerOfHanoi(1, beg, aux, end);
    // towerOfHanoi(n-1, aux, beg, end);
}

int main() {
    towerOfHanoi(2, 'A', 'B', 'C');
}