import matplotlib.pyplot as plt
import numpy as np

def fun(x):
    return - ((x - 2) ** 2) + 4

li = np.arange(-10, 10)

plt.plot(li, fun(li))
plt.show()
