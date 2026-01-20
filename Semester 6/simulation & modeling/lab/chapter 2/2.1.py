import random
import matplotlib.pyplot as plt
from shapely.geometry import Point, Polygon

coords = [(1, 1), (10, 95), (40, 70), (50, 50),(30,20)]
map = Polygon(coords)

x_point = []
y_point = []

coords = [(1, 1), (10, 95), (40, 70), (50, 50),(30,20)]
map = Polygon(coords)

x, y = zip(*coords)
plt.plot(x + (x[0],), y + (y[0],), color="red")

plt.show()
