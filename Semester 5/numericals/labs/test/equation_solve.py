import matplotlib.pyplot as plt
import numpy as np

mat = [
        [2.0, 1, -1, 8],
        [-3, -1, 2, -11],
        [-2, 1, 2, -3]
    ]

mat = np.array(mat)

def det(arr):
    a =   arr[0][0] * ( arr[1][1] * arr[2][2] - arr[1][2] * arr[2][1] )
    b = - arr[1][0] * ( arr[0][1] * arr[2][2] - arr[0][2] * arr[2][1] )
    c =   arr[2][0] * ( arr[0][1] * arr[1][2] - arr[0][2] * arr[1][1] )
    return a + b + c

def cramers(mat):
    D = np.array(mat[:,0:3])
    C = np.array(mat[:,-1])

    Dx = np.array([C, D[:,1], D[:,2]])
    Dy = np.array([D[:,0], C, D[:,2]])
    Dz = np.array([D[:,0], D[:,1],C])

    print(det(Dx) / det(D))
    print(det(Dy) / det(D))
    print(det(Dz) / det(D))

def print_mat(mat):
    for i in mat:
        for j in i:
            print(j, end=" | ")
        print()
    print("-" * 20)

def gauss_jordan(mat):
    n = len(mat)
    for i in range(n):
        for j in range(n):
            if i != j:
                temp = mat[j][i] / mat[i][i]
                for k in range(n+1):
                    mat[j][k] -= mat[i][k] * temp

        print_mat(mat)
    for i in range(n):
        print(mat[i][-1]/mat[i][i])

print(mat)

# 2.0
# 3.0
# -1.0
# cramers(mat)

print("-+" * 10)

gauss_jordan(mat)
