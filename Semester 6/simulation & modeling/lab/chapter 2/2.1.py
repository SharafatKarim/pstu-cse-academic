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

inside = 0
outside = 0

for _ in range(1000):
    x_rand = random.uniform(0, 60)
    y_rand = random.uniform(0, 100)
    point = Point(x_rand, y_rand)
    if map.contains(point):
        inside += 1
        x_point.append(x_rand)
        y_point.append(y_rand)
    else:
        outside += 1
        plt.plot(x_rand, y_rand, 'ro', alpha=0.1)

plt.plot(x_point, y_point, 'go', alpha=0.1)
plt.title(f'Points Inside and Outside the Polygon\nInside: {inside}, Outside: {outside}')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')

area_map = map.area
predicted_area = (inside / (inside + outside)) * (60 * 100)
print(f"Predicted Area: {predicted_area}, Actual Area: {area_map}")

plt.show()