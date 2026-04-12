from shapely.geometry import Point, Polygon
import matplotlib.pyplot as plt
import random

coords = [(1, 1), (10, 95), (40, 70), (50, 50),(30,20)]
shape = Polygon(coords)

point_in = 0
out = 0
in_points = []
out_points = []

for i in range(1000):
    x = random.randint(1, 60)
    y = random.randint(1, 100)

    if shape.contains(Point(x, y)):
         point_in += 1
         in_points.append([x, y])
    else:
        out += 1
        out_points.append((x, y))

print("Area -> ", point_in * 100 * 60 / (point_in + out))
print("Actual area -> ", shape.area)
plt.scatter([i[0] for i in in_points], [i[1] for i in in_points])
plt.scatter([i[0] for i in out_points], [i[1] for i in out_points])
plt.plot([i[0] for i in coords] + [coords[0][0]], [i[1] for i in coords] + [coords[0][1]])
plt.show()
