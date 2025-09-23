import numpy as np
import matplotlib.pyplot as plt

np.random.seed(0)
x = 2 * np.random.rand(100, 1)
y = 4 + 3 * x + np.random.randn(100, 1)

def gradient_descent(x, y, m = 0, b = 0, learning_rate = 0.01, epochs = 10000):
    n = len(y)
    for _ in range(epochs):
        y_pred = m * x + b
        dm = (-2/n) * sum(x * (y - y_pred))
        db = (-2/n) * sum(y - y_pred)
        m -= learning_rate * dm
        b -= learning_rate * db
    return m, b

plt.scatter(x, y)

m, b = gradient_descent(x, y)
plt.plot(x, m*x + b, color='red')

plt.xlabel('X')
plt.ylabel('Y')

plt.title('Gradient Descent')
plt.show()
