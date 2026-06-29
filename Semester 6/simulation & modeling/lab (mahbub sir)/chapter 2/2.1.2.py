import matplotlib.pyplot as plt
from shapely.geometry import Point, Polygon
import random

coords = [(1, 1), (10, 95), (40, 70), (50, 50),(30,20)]
shape = Polygon(coords)

x = []
y = []
inside_x = []
inside_y = []
outside_x = []
outside_y = []

plt.plot([i[0] for i in coords] + [coords[0][0]], [i[1] for i in coords] + [coords[0][1]])

for i in range(10000):
    x = random.randint(1, 60)
    y = random.randint(1, 100)
    if shape.contains(Point(x, y)):
        inside_x.append(x)
        inside_y.append(y)
    else:
        outside_x.append(x)
        outside_y.append(y)

print("Calculated -> ", len(inside_x)*100*60/(len(outside_x)+len(inside_x)))
print("Original   -> ", shape.area)

plt.scatter(inside_x, inside_y)
plt.scatter(outside_x, outside_y)
plt.show()
