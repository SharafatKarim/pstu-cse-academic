import matplotlib.pyplot as plt
import numpy as np

def f(x):
    f = x ** 2 + x - 4
    return f

def f2(x):
    if (4 - x) < 0:
        raise Exception("Cannot take square root of a negative number")
    return (4 - x)**0.5

def f_prime(x):
    return 2 * x + 1

def iteration(f, f2, n):
    for i in range(1000):
        if abs(f2(n) - n) < 1e-6:
            return n
        print(n)
        n = f2(n)
    raise Exception("didn't converge")


def newton_raphson(f, f_prime, n):
    for i in range(1000):
        if abs(f(n)) < 1e-6:
            return n
        n = n - (f(n) / f_prime(n))
    raise("didn't converge")

def bisetion(f, a, b):
    if f(a) * f(b) > 0:
        raise("won't work")
    c = (a + b) / 2
    if(abs(f(c)) < 1e-11):
        # print(c)
        return c
    elif f(a) * f(c) < 0:
        b = c
        return bisetion(f, a, b)
    else:
        a = c
        return bisetion(f, a, b)

def false_pos(f, a, b):
    if f(a) * f(b) > 0:
        raise("won't work")
    c = b - f(b) * (a-b) / ((f(a) - f(b)))
    if(abs(f(c)) < 1e-11):
        # print(c)
        return c
    elif f(a) * f(c) < 0:
        b = c
        return bisetion(f, a, b)
    else:
        a = c
        return bisetion(f, a, b)

# sol = false_pos(f, 0, 10)
# sol = newton_raphson(f, f_prime, 1)
sol = iteration(f, f2, 1)
print(sol)

x = np.arange(-10, 10)
print(x)

plt.plot(x,f(x))
plt.scatter(sol, 0)

plt.grid()
plt.show()
