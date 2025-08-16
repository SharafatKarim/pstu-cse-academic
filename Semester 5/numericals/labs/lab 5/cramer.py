import numpy as np

arr = [
    [2, 1, -1, 8],
    [-3, -1, 2, -11],
    [-2, 1, 2, -3]
    ]

main_array = np.array(arr)
D = np.array(main_array[:,:-1])

last_col  = np.array(main_array[:,-1])

D1 = np.array([last_col, main_array[:,1], main_array[:,2]])
D2 = np.array([main_array[:,0], last_col, main_array[:,2]])
D3 = np.array([main_array[:,0], main_array[:,1], last_col])

D_det = np.linalg.det(D)
D1_det = np.linalg.det(D1)
D2_det = np.linalg.det(D2)
D3_det = np.linalg.det(D3)

print("x = ", D1_det / D_det)
print("y = ", D2_det / D_det)
print("z = ", D3_det / D_det)
