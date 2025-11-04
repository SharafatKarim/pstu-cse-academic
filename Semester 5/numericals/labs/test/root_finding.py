import matplotlib.pyplot as plt
import numpy as np

def f(x):
    f = x ** 2 + x - 4
    return f

def f2(x):
    return (4 - x) ** 0.5

def f_prime(x):
    return 2 * x + 1

def iteration(f, f2, n):
    for i in range(1000):
        if abs(f2(n) - n) < 1e-6:
            return n
        print(n)
        n = f2(n)
    raise Exception("didn't converge")

sol = iteration(f, f2, 1)
print(sol)

x = np.arange(-10, 10)
print(x)

plt.plot(x,f(x))
plt.scatter(sol, 0)

plt.grid()
plt.show()
