import numpy as np
import matplotlib.pyplot as plt

def f(x, y):
    return x + y

# yn = y_n-1 + h * f(x, y_n-1)
def euler(f, x0, y0, h=0.1, lim=100):
    x = [x0]
    y = [y0]

    for i in range(lim):
        y_n = y[-1]
        x_n = x[-1]

        y_new = y_n + h * f(x_n, y_n)
        y.append(y_new)
        x.append(x_n + h)

    return x,y

def picard(f, x0, y0, h=0.1, lim=100):
    x = [x0]
    y = [y0]

    for i in range(lim):
        y_n = y[-1]
        x_n = x[-1]

        y_new = 1 + x_n + x_n **2 / 2 + x_n ** 3 /3 + x_n ** 4 / 8 + x_n ** 5 / 15 + x_n ** 6 / 48
        y.append(y_new)
        x.append(x_n + h)

    return x,y

def rk4(f, x0, y0, h=0.1, lim=100):
    x = [x0]
    y = [y0]

    for i in range(lim):
        y_n = y[-1]
        x_n = x[-1]

        k1 = f(x_n, y_n)
        k2 = f(x_n+h/2, y_n + h*k1/2)
        k3 = f(x_n+h/2, y_n + h*k2/2)
        k4 = f(x_n+h, y_n + h*k3)

        y_new = y_n + h / 6 * (k1 + 2 * k2 + 2 * k3 + k4)

        y.append(y_new)
        x.append(x_n + h)

    return x,y

def milnes(f, x0, y0, x1, y1, x2, y2, x3, y3, x4):
    h = x1 - x0
    y4 = y0 + 4 * h / 3 * (2 * f(x1, y1) - f(x2, y2) + 2 * f(x3, y3))
    y_c = y2 + h / 3 * (f(x2, y2) + 4 * f(x3, y3) + f(x4, y4))

    return y_c

x0 = 0
y0 = 1

x, y = rk4(f, x0, y0)

y4 = milnes(f, x[0], y[0], x[1], y[1], x[2], y[2], x[3], y[3], x[4])
print(y4)
print(y[4])

plt.plot(x, y)
plt.show()
