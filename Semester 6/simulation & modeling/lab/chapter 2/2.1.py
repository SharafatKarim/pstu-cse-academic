import random

import matplotlib.pyplot as plt

class NumericalIntegrationPoints:
    def __init__(self, points, range_x_in, range_x_out, range_y_in, range_y_out, iteration=50000):
        self.points = points  # List of (x, y) tuples
        self.inside = 0
        self.outside = 0
        self.iteration = iteration
        self.range_x_in = range_x_in
        self.range_x_out = range_x_out
        self.range_y_in = range_y_in
        self.range_y_out = range_y_out

    def point_in_polygon(self, x, y):
        """Ray casting algorithm to check if point is inside polygon"""
        n = len(self.points)
        inside = False
        
        p1x, p1y = self.points[0]
        for i in range(1, n + 1):
            p2x, p2y = self.points[i % n]
            if y > min(p1y, p2y):
                if y <= max(p1y, p2y):
                    if x <= max(p1x, p2x):
                        if p1y != p2y:
                            xinters = (y - p1y) * (p2x - p1x) / (p2y - p1y) + p1x
                        if p1x == p2x or x <= xinters:
                            inside = not inside
            p1x, p1y = p2x, p2y
        return inside

    def run(self):
        iteration = self.iteration
        while iteration > 0:
            random_x = random.uniform(self.range_x_in, self.range_x_out)
            random_y = random.uniform(self.range_y_in, self.range_y_out)

            if self.point_in_polygon(random_x, random_y):
                self.inside += 1
            else:
                self.outside += 1
            
            iteration -= 1

    def area_approximate(self):
        self.run()
        rectangle_area = (self.range_x_out - self.range_x_in) * (self.range_y_out - self.range_y_in)
        return (self.inside / (self.inside + self.outside)) * rectangle_area

# Example: Triangle with vertices at (1,1), (5,1), (3,5)
polygon_points = [(1, 1), (5, 1), (3, 5)]
areaFinder = NumericalIntegrationPoints(polygon_points, 0, 6, 0, 6, 100000)
print(f"Approximate area: {areaFinder.area_approximate()}")