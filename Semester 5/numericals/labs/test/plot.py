import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import CubicSpline

a = [0, 1, 3]
b = [1 , 8, 10]

f = CubicSpline(a, b)

n = np.linspace(0, 3)
plt.plot(n, f(n))
plt.fill_between(n, f(n), alpha=0.1)
plt.scatter(a, b)
plt.axvline(0)
plt.axhline(0)
plt.grid()
plt.show()
