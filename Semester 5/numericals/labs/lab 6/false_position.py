import matplotlib.pyplot as plt
import numpy as np

def false_position_method(f, a, b, tol=1e-5):
    if f(a) * f(b) >= 0:
        raise ValueError("f(a) and f(b) must have opposite signs.")

    c = a - (f(a) * (b - a) / (f(b) - f(a)))

    if abs(f(c)) < tol:
        return c
    elif f(a) * f(c) < 0:
        return false_position_method(f, a, c, tol)
    else:
        return false_position_method(f, c, b, tol)

# Simple function
def f(x):
  return x**2 - 2

root = false_position_method(f, 0, 10)

# Let's plot the result
x = np.arange(0, 3, 0.1)
print(x) # Print the values of x

plt.plot(x, f(x))
plt.axvline(root)

plt.grid()
plt.show()
