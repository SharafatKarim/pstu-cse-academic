import numpy as np
import matplotlib.pyplot as plt

def f(x, y):
    return (x - y)/2

def runge_kutta_4th_order(f, y0, x0, x1, h):
    n = int((x1 - x0) / h)
    x_values = np.linspace(x0, x1, n + 1)
    y_values = np.zeros(n + 1)
    y_values[0] = y0

    for i in range(n):
        x = x_values[i]
        y = y_values[i]

        k1 = h * f(x, y)
        k2 = h * f(x + h / 2, y + k1 / 2)
        k3 = h * f(x + h / 2, y + k2 / 2)
        k4 = h * f(x + h, y + k3)

        y_values[i + 1] = y + (k1 + 2 * k2 + 2 * k3 + k4) / 6

    return x_values, y_values

# Initial conditions and parameters for RK4
y0 = 1
x0 = 0
x1 = 10
h = 0.1
x_values, y_values_rk4 = runge_kutta_4th_order(f, y0, x0, x1, h)

# Plotting the results of RK4
plt.plot(x_values, y_values_rk4, label="Runge-Kutta 4th Order", color='red')
plt.title("Runge-Kutta 4th Order Method for Solving ODE")
plt.xlabel('t')
plt.ylabel('y')
plt.legend()
plt.grid()
plt.show()
