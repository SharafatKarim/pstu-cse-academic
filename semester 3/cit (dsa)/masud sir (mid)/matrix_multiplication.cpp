#include <iostream>
using namespace std;

int** createMatrix(int row, int column) {
    int **matrix = new int*[row];
    for (int i=0; i < row; i++) {
        matrix[i] = new int[column];
    }
    return matrix;
}

void printMatrix(int **matrix, int row, int column) {
    for (int i=0; i < row; i++) {
        for (int j=0; j < column; j++) {
            cout << matrix[i][j] << " ";
        }
        cout << endl;
    }
}

void deleteMatrix(int **matrix, int row) {
    for (int i=0; i < row; i++) {
        delete[] matrix[i];
    }
    delete[] matrix;
}

void matrixMultiplication(int matrix_a[][3], int matrix_b[][3], int **matrix_c, int M, int P, int N) {
    for (int i=0; i < M; i++) {
        for (int j=0; j < N; j++) {
            matrix_c[i][j] = 0;
            for (int k=0; k < P; k++) {
                matrix_c[i][j] += matrix_a[i][k] * matrix_b[k][j];
            }
        }
    }
}

int main() {
    int matrix_a[][3] = {{1, -2, 3}, {0, 4, 5}}; // M x P
    int matrix_b[][3] = {{3, 0, -6}, {2, -3, 1}, {2, 5, 3}}; // P x N

    int **matrix_c;
    matrix_c = createMatrix(2, 3);

    matrixMultiplication(matrix_a, matrix_b, matrix_c, 2, 3, 3);
    printMatrix(matrix_c, 2, 3);
    deleteMatrix(matrix_c, 2);
}