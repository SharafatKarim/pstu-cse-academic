import numpy as np
import matplotlib.pyplot as plt
import random

def fun(x):
    return x**3

class Integration():
    def __init__(self, limit_x_low=0, limit_x_high=5, limit_y_low=0, limit_y_high=5):
        self.limit_x_low = limit_x_low
        self.limit_x_high = limit_x_high
        self.limit_y_low = limit_y_low
        self.limit_y_high = limit_y_high

        self.points_in_history = []
        self.points_out_history = []

    def run_calc(self, it=1000):
        points_in = 0
        points_out = 0

        for i in range(it):
            x = random.uniform(self.limit_x_low, self.limit_x_high)
            target_y = fun(x)
            y = random.uniform(self.limit_y_low, self.limit_y_high)

            if target_y > y:
                points_in += 1
                self.points_in_history.append((x, y))
            else:
                points_out += 1
                self.points_out_history.append((x, y))

        return points_in * (self.limit_x_high-self.limit_x_low) * (self.limit_y_high-self.limit_y_low) / (points_in + points_out)

    def plot(self):
        x = np.linspace(0, 7, 100)
        plt.plot(x, fun(x))
        plt.scatter([i[0] for i in self.points_in_history], [i[1] for i in self.points_in_history], alpha=0.01, s=1)
        plt.scatter([i[0] for i in self.points_out_history], [i[1] for i in self.points_out_history], alpha=0.01, s=1)
        plt.show()

integral = Integration(2, 5, 0, 140)
print(integral.run_calc(100_000))
integral.plot()
