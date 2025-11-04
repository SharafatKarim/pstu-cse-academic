import matplotlib.pyplot as plt
import numpy as np

mat = [
        [2, 1, -1, 8],
        [-3, -1, 2, -11],
        [-2, 1, 2, -3]
    ]

mat = np.array(mat)

def deter():
    pass

def cramers(mat):
    D = mat[:,0:3]
    Dx = mat[:,1:3]

    print(np.concatenate((mat, mat)))

cramers(mat)
