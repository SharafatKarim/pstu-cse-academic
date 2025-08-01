N = 3
arr = [[2, 1, -1, 8], [-3, -1, 2, -11], [-2, 1, 2, -3]]

def print_arr(arr):
  for i in range(N):
    print(arr[i])

def gaussian_elimination(N, arr):
  for i in range(N):
    for j in range(N, -1, -1):
      arr[i][j] /= arr[i][0+i]

    for j in range(i+1, N):
      for k in range(N, -1, -1):
        arr[j][k] -= arr[i][k] * arr[j][0+i]

    print_arr(arr)
    print()

  solve = [0 for j in range(N)]
  for i in range(N-1, -1, -1):
    for j in range(N):
      solve[i] = arr[i][N]
      for k in range(i+1, N):
        solve[i] -= arr[i][k] * solve[k]
    solve[i] /= arr[i][i]
  print(solve)

gaussian_elimination(N, arr)
