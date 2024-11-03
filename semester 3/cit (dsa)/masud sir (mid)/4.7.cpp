#include <iostream>
#include <vector>
using namespace std;

void matrixMultiplication(vector<vector<int>> matrix_a, vector<vector<int>> matrix_b, int M, int P, int N) {
    int matrix_c[M][N];
    for (int i=0; i < M; i++) {
        for (int j=0; j < N; j++) {
            matrix_c[i][j] = 0;
            for (int k=0; k < P; k++) {
                matrix_c[i][j] += matrix_a[i][k] * matrix_b[k][j];
            }
        }
    }
    for (int i=0; i < M; i++) {
        for (int j=0; j < N; j++) {
            cout << matrix_c[i][j] << " ";
        }
        cout << endl;
    }
}

int main() {

    int m, p, n;
    cout << "Enter dimention: [MxP] x [PxN] : (m, p, n) \n";
    cin >> m >> p >> n;

    cout << "Enter first matrix: \n";
    // int matrix_a[m][p], matrix_b[p][n];
    vector<vector<int>> matrix_a(m, vector<int>(p));
    vector<vector<int>> matrix_b(p, vector<int>(n));
    for (int i=0; i<m; i++) {
        for (int j=0; j<p; j++) {
            cin >> matrix_a[i][j];
        }
    }
    cout << "Enter second matrix: \n";
    for (int i=0; i<p; i++) {
        for (int j=0; j<n; j++) {
            cin >> matrix_b[i][j];
        }
    }

    cout << "\n";
    cout << "Multiplied matrix :" << endl;
    matrixMultiplication(matrix_a, matrix_b, m, p, n);

    // int matrix_a[][3] = {{1, -2, 3}, {0, 4, 5}}; // M x P
    // int matrix_b[][3] = {{3, 0, -6}, {2, -3, 1}, {2, 5, 3}}; // P x N

    // matrixMultiplication(matrix_a, matrix_b, 2, 3, 3);
}
