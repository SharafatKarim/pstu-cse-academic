#include <iostream>
#include <vector>
using namespace std;

int main() {
    vector<vector<int>> mat = {
        {7, 5, 0, 0},
        {7, 0, 0, 2},
        {0, 3, 0, 0},
        {4, 0, 1, 0}
    };
    int length = mat.capacity();

    for (int k=0; k <length; k++) {
        for (int i=0; i <length; i++) {
            for (int j=0; j <length; j++) {
                mat[i][j] = mat[i][j] || (mat[i][k] && mat[k][j]);
            }
        }
    }
    for (int i=0; i <length; i++) {
        for (int j=0; j <length; j++) {
            cout << mat[i][j];
        }
        cout << endl;
    }
}
