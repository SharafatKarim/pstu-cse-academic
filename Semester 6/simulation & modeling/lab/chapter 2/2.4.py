import random, math
import matplotlib.pyplot as plt
import numpy as np

def fun(x):
    return math.sqrt(1-x*x)

class PiEstimation:
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
            random_num_x = random.random()
            random_num_y = random.random()

            y_real_value = fun(random_num_x)
            if random_num_y <= y_real_value:
                self.inside += 1
            else:
                self.outside += 1
            
            iteration -= 1
    
    def area_approximate(self):
        self.run()
        return (self.inside / (self.inside + self.outside) * 4)

areaFinder = PiEstimation(0, 1, 0, 1, 1000000)
print(areaFinder.area_approximate())