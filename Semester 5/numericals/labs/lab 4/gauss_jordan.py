N = 3
arr = [
    [2, 1, -1, 8],
    [-3, -1, 2, -11],
    [-2, 1, 2, -3]
    ]

def print_array(arr, N):
    for i in range(N):
        print(arr[i])

def gauss_jordan(arr, N):
    for i in range(N):
        for j in range(N):
            if i != j:
                p = arr[j][i] / arr[i][i]
                for k in range(N+1):
                    arr[j][k] -= arr[i][k] * p

    for i in range(N):
        print(arr[i][3] / arr[i][i])

print("Initial matrix : ")
print_array(arr, N)

print("Solution : ")
gauss_jordan(arr, N)

