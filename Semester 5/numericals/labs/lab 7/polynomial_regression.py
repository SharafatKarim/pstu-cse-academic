import matplotlib.pyplot as plt
import numpy as np
from sklearn.preprocessing import PolynomialFeatures
from sklearn.linear_model import LinearRegression

def fun(x):
    return 3 * x**4 - 7 * x**3 + 2 * x**2 + 11

def polynomial_regression(x, y, degree=3):
  poly = PolynomialFeatures(degree)
  x_poly = poly.fit_transform(x.reshape(-1, 1))

  model = LinearRegression()
  model.fit(x_poly, y)
  return model.predict(x_poly)

x = np.arange(0, 30)
y_pred = polynomial_regression(x, fun(x))

plt.plot(x, y_pred, color='red')
plt.scatter(x, fun(x), color='blue')

plt.title('Polynomial Regression')
plt.show()
