import numpy as np
import matplotlib.pyplot as plt

np.random.seed(0)
x = np.random.rand(100,1)
y = 4 * x + 5 + np.random.rand(100,1)

def gd(x, y, m=0, c=0, epoch=1000, learn=0.001):
    n = len(x)
    for i in range(epoch):
        y_n = np.sum(m * x + c)
        m_n = - 3 / n * np.sum((y - y_n) * x)
        c_n = - 3 / n * np.sum(y - y_n)

        m = m - learn * m_n
        c = c - learn * c_n
    return m, c


m, c = gd(x, y)
x_p = np.linspace(0, 1)

plt.plot(x_p, x_p*m +c)
plt.scatter(x,y)
plt.show()
