import numpy as np
import matplotlib.pyplot as plt

def f(x):
    return x**2

def trapezoidal(f, a , b):
    return ((b - a) / 2) * (f(a) + f (b))

def simpson_one_third(f, a, b):
    return (b-a) /6 * (f(a) + 4 * f((a+b)/2) + f(b))

def simpson_three_eight(f, a, b):
    h = (b - a) / 3
    return 3*h/8*(f(a) + 3 * f(a+h) + 3 * f(a+2*h) + f(b) )

print(trapezoidal(f, 0, 100))
print(simpson_one_third(f, 0, 100))
print(simpson_three_eight(f, 0, 100))

x = np.linspace(0, 100)
plt.plot(x, f(x))
plt.show()
