import numpy as np
import matplotlib.pyplot as plt

# Third apporximation
def Y3(x):
    return (
        1
        + (x)
        + pow(x, 2) / 2
        + pow(x, 3) / 3
        + pow(x, 4) / 8
        + pow(x, 5) / 15
        + pow(x, 6) / 48
    )

def picard_method(f, x0, h=0.1, n=10, iterations=3):
    x_values = np.arange(x0, x0 + n * h, h)
    y_values = np.array([f(i) for i in x_values])

    return x_values, y_values

x_values, y_values = picard_method(f=Y3, x0=0, h=0.1)

plt.plot(x_values, y_values)
plt.scatter(x_values[1], y_values[1], label=f'Point at x={x_values[1]:.1f}')
plt.scatter(x_values[2], y_values[2], label=f'Point at x={x_values[2]:.1f}')
plt.legend()
plt.show()
