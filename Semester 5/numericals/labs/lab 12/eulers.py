import numpy as np
import matplotlib.pyplot as plt

def f(x, y):
    return x + y

def euler_method(f, x0, y0, h=0.1, n=100):
    x_values = [x0]
    y_values = [y0]

    for i in range(n):
        y0 = y0 + h * f(x0, y0)
        x0 = x0 + h
        x_values.append(x0)
        y_values.append(y0)

    return np.array(x_values), np.array(y_values)

# Initial conditions and parameters
x0 = 0
y0 = 1
h = 0.1  # Step size
n = 100  # Number of steps
x_values, y_values = euler_method(f, x0, y0, h, n)

# Plotting the results
plt.plot(x_values, y_values, label="Euler's Method", color='blue')
plt.title("Euler's Method for Solving ODE")
plt.xlabel('x')
plt.ylabel('y')
plt.legend()
plt.grid()

plt.show()
