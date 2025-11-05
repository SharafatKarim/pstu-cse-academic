import numpy as np
import matplotlib.pyplot as plt

x = list(map(float, input("Enter the x values: ").split()))
y = list(map(float, input("Enter the y (0 or 1) values: ").split()))

x = np.array(x)
y = np.array(y)

n = len(x)
m = ((n*np.sum(x*y)) - (np.sum(x)*np.sum(y))) / ((n*np.sum(x**2)) - (np.sum(x)**2))
c = (np.sum(y) - m*np.sum(x)) / n

print(f"P(Y=1) = 1 / (1 + e^-({m:.4f}X + {c:.4f}))")
x_val = np.linspace(-10, 10, 200)
y_val = 1 / (1 + np.exp(-(m*x_val + c)))

plt.scatter(x, y, color='red', label='Actual Data')
plt.plot(x_val, y_val, color='blue', label='Logistic Curve')
plt.xlabel("X")
plt.ylabel("Probability (Y=1)")
plt.title("Simple Logistic Regression")
plt.grid(True)
plt.legend()
plt.show()
