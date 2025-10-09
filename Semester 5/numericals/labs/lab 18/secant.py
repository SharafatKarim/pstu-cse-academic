import matplotlib.pyplot as plt
import numpy as np

# Our function
def f(x):
    return x**2 - 2

def secant_method(f, x0, x1, tol=1e-7, max_iter=100):
    for i in range(max_iter):
        if abs(f(x1)) < tol:
            return x1
        if f(x1) == f(x0):  # Prevent division by zero
            print("Division by zero encountered in secant method.")
            return None
        # Secant method formula
        x2 = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0))
        x0, x1 = x1, x2
    print("Maximum iterations reached without convergence.")
    return None

print(secant_method(f, 1, 2))

root = secant_method(f, 1, 2)

# Let's plot the result
x = np.arange(0, 3, 0.1)
plt.plot(x, f(x), label='f(x) = x^2 - 2')
plt.scatter(root, f(root), color='blue')  # Mark the root on the plot
plt.axvline(root, color='purple', linestyle='--', label=f'x = root ({root:.5f})')
plt.show()
