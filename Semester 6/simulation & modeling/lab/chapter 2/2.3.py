import random
import matplotlib.pyplot as plt
import numpy as np

def fun(x):
    return x**3

class NumericalIntegration:
    def __init__(self, range_x_in, range_x_out, range_y_in, range_y_out, iteration=50):
        self.inside = 0
        self.outside = 0
        self.iteration = iteration
        self.range_x_in = range_x_in
        self.range_x_out = range_x_out
        self.range_y_in = range_y_in
        self.range_y_out = range_y_out

    def run(self):
        iteration = self.iteration
        while iteration > 0:
            random_num_x = random.uniform(self.range_x_in, self.range_x_out)
            random_num_y = random.uniform(self.range_y_in, self.range_y_out)

            y_real_value = fun(random_num_x)
            if random_num_y <= y_real_value:
                self.inside += 1
            else:
                self.outside += 1
            
            iteration -= 1
    
    def area_approximate(self):
        self.run()

        rectangle_area = (self.range_x_out - self.range_x_in) * (self.range_y_out - self.range_y_in)
        return (self.inside / (self.inside + self.outside) * rectangle_area)

areaFinder = NumericalIntegration(2, 5, 0, 140, 10000)
print(areaFinder.area_approximate())