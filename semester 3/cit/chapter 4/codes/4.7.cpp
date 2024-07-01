#include <iostream>
using namespace std;

void matrixMultiplication(int matrix_a[][3], int matrix_b[][3], int M, int P, int N) {
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
    int matrix_a[][3] = {{1, -2, 3}, {0, 4, 5}}; // M x P
    int matrix_b[][3] = {{3, 0, -6}, {2, -3, 1}, {2, 5, 3}}; // P x N

    matrixMultiplication(matrix_a, matrix_b, 2, 3, 3);
}