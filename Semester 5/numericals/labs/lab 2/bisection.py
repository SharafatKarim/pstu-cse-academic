import matplotlib.pyplot as plt
import numpy as np

def bisection_method(f, a, b, tol=1e-5):
    if f(a) * f(b) >= 0:
        raise ValueError("f(a) and f(b) must have opposite signs.")

    mid = (a + b) / 2.0

    if abs(f(mid)) < tol:
        return mid
    elif f(a) * f(mid) < 0:
        return bisection_method(f, a, mid, tol)
    else:
        return bisection_method(f, mid, b, tol)

# Simple function
def f(x):
  return x**2 - 2

root = bisection_method(f, 0, 10)

# Let's plot the result
x = np.arange(0, 3, 0.1)
print(x) # Print the values of x

plt.plot(x, f(x))
plt.axvline(root)

plt.grid()
plt.show()
