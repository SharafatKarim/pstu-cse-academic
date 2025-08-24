import numpy as np
import matplotlib.pyplot as plt
import math

def fun(x):
  return 0.2 + 25 * x - 200 * x**2 + 675 * x**3 - 900 * x**4 + 400 * x**5

def fun2(x):
  return math.log(x)

def trapezoidal_rule(fun, a, b):
  return (b - a) * (fun(a) + fun(b)) / 2

def simpsons_1_3_rule(fun, a, b):
    return (b - a) / 6 * (fun(a) + 4 * fun((a + b) / 2) + fun(b))

array = np.arange(-0.01, 0.82, 0.01)

print(trapezoidal_rule(fun, 0, 0.8))
plt.plot(array, fun(array))
plt.plot([0, 0.8], [fun(0), fun(0.8)], color='red')
plt.show()

print(simpsons_1_3_rule(fun2, 4, 5.2))
