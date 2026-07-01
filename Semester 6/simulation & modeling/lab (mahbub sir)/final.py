import matplotlib.pyplot as plt
import matplotlib.animation as animation
import math, random
from scipy.interpolate import make_interp_spline
import numpy as np

def distance(x1, y1, x2, y2):
    return math.sqrt((x1-x2)**2 + (y1-y2)**2)

class SerialChase:
    def __init__(self):
        self.v = 1
        self.time_step = 0.1
        self.collision_min = 1
       
        self.x1 = [random.randint(0, 10)]
        self.y1 = [random.randint(0, 10)]
        self.x2 = [random.randint(0, 10)]
        self.y2 = [random.randint(0, 10)]
        self.x3 = [random.randint(0, 10)]
        self.y3 = [random.randint(0, 10)]
        self.x4 = [random.randint(0, 10)]
        self.y4 = [random.randint(0, 10)]
        self.x5 = [random.randint(0, 10)]
        self.y5 = [random.randint(0, 10)]

        self.collision_history = []
        self.window_history = []

    def simulate_one_run(self, window, time_limit=1000):
        self.x1 = [random.randint(0, window)]
        self.y1 = [random.randint(0, window)]
        self.x2 = [random.randint(0, window)]
        self.y2 = [random.randint(0, window)]
        self.x3 = [random.randint(0, window)]
        self.y3 = [random.randint(0, window)]
        self.x4 = [random.randint(0, window)]
        self.y4 = [random.randint(0, window)]
        self.x5 = [random.randint(0, window)]
        self.y5 = [random.randint(0, window)]

        collision = 0
        time = 0
        while time < time_limit:

            if distance(self.x1[-1], self.y1[-1], self.x2[-1], self.y2[-1]) < self.collision_min:
                collision += 1
            if distance(self.x1[-1], self.y1[-1], self.x3[-1], self.y3[-1]) < self.collision_min:
                collision += 1
            if distance(self.x1[-1], self.y1[-1], self.x4[-1], self.y4[-1]) < self.collision_min:
                collision += 1
            if distance(self.x1[-1], self.y1[-1], self.x5[-1], self.y5[-1]) < self.collision_min:
                collision += 1

            if distance(self.x2[-1], self.y2[-1], self.x3[-1], self.y3[-1]) < self.collision_min:
                collision += 1
            if distance(self.x2[-1], self.y2[-1], self.x4[-1], self.y4[-1]) < self.collision_min:
                collision += 1
            if distance(self.x2[-1], self.y2[-1], self.x5[-1], self.y5[-1]) < self.collision_min:
                collision += 1

            if distance(self.x3[-1], self.y3[-1], self.x4[-1], self.y4[-1]) < self.collision_min:
                collision += 1
            if distance(self.x3[-1], self.y3[-1], self.x5[-1], self.y5[-1]) < self.collision_min:
                collision += 1

            if distance(self.x4[-1], self.y4[-1], self.x5[-1], self.y5[-1]) < self.collision_min:
                collision += 1
            
            current_x1 = self.x1[-1]
            current_y1 = self.y1[-1]
            current_x2 = self.x2[-1]
            current_y2 = self.y2[-1]
            current_x3 = self.x3[-1]
            current_y3 = self.y3[-1]
            current_x4 = self.x4[-1]
            current_y4 = self.y4[-1]
            current_x5 = self.x5[-1]
            current_y5 = self.y5[-1]

            while True:
                temp = current_x1 + random.randint(-1, 1) * self.v
                if 0 <= temp <= window:
                    current_x1 = temp
                    break

            while True:
                temp = current_y1 + random.randint(-1, 1) * self.v
                if 0 <= temp <= window:
                    current_y1 = temp
                    break

            while True:
                temp = current_x2 + random.randint(-1, 1) * self.v
                if 0 <= temp <= window:
                    current_x2 = temp
                    break

            while True:
                temp = current_y2 + random.randint(-1, 1) * self.v
                if 0 <= temp <= window:
                    current_y2 = temp
                    break

            while True:
                temp = current_x3 + random.randint(-1, 1) * self.v
                if 0 <= temp <= window:
                    current_x3 = temp
                    break

            while True:
                temp = current_y3 + random.randint(-1, 1) * self.v
                if 0 <= temp <= window:
                    current_y3 = temp
                    break

            while True:
                temp = current_x4 + random.randint(-1, 1) * self.v
                if 0 <= temp <= window:
                    current_x4 = temp
                    break

            while True:
                temp = current_y4 + random.randint(-1, 1) * self.v
                if 0 <= temp <= window:
                    current_y4 = temp
                    break

            while True:
                temp = current_x5 + random.randint(-1, 1) * self.v
                if 0 <= temp <= window:
                    current_x5 = temp
                    break

            while True:
                temp = current_y5 + random.randint(-1, 1) * self.v
                if 0 <= temp <= window:
                    current_y5 = temp
                    break

            self.x1.append(current_x1)
            self.y1.append(current_y1)

            self.x2.append(current_x2)
            self.y2.append(current_y2)

            self.x3.append(current_x3)
            self.y3.append(current_y3)

            self.x4.append(current_x4)
            self.y4.append(current_y4)

            self.x5.append(current_x5)
            self.y5.append(current_y5)

            time += self.time_step
        return collision
        
    def simulate_multi_run(self):
        self.collision_history = []
        self.window_history = []

        for window in range(10, 101, 10):
            sim = SerialChase()
            collision = sim.simulate_one_run(window)

            self.window_history.append(window)
            self.collision_history.append(collision)

        # Plot
        # plt.figure(figsize=(8, 5))
        # plt.plot(self.window_history,
        #          self.collision_history,
        #          marker='o',
        #          linewidth=2)

        # plt.xlabel("Window Size")
        # plt.ylabel("Number of Collisions")
        # plt.title("Collisions vs Window Size")
        # plt.grid(True)
        # plt.show()

        # cubic spine
        x = np.array(self.window_history)
        y = np.array(self.collision_history)

        x_smooth = np.linspace(x.min(), x.max(), 300)

        spline = make_interp_spline(x, y, k=3)
        y_smooth = spline(x_smooth)

        plt.figure(figsize=(8,5))
        plt.plot(x_smooth, y_smooth, 'b-', label='Interpolated')
        plt.scatter(x, y, color='red', zorder=3, label='Original data')

        plt.xlabel("Window Size")
        plt.ylabel("Number of Collisions")
        plt.title("Collisions vs Window Size")
        plt.grid(True)
        plt.legend()
        plt.show()

    def animate_run(self, window=10, time_limit=10):
        # Generate trajectory
        self.simulate_one_run(window, time_limit)

        fig, ax = plt.subplots(figsize=(6, 6))
        ax.set_xlim(0, window)
        ax.set_ylim(0, window)
        ax.set_aspect('equal')

        p1, = ax.plot([], [], 'ro', markersize=8, label='1')
        p2, = ax.plot([], [], 'bo', markersize=8, label='2')
        p3, = ax.plot([], [], 'go', markersize=8, label='3')
        p4, = ax.plot([], [], 'mo', markersize=8, label='4')
        p5, = ax.plot([], [], 'ko', markersize=8, label='5')

        ax.legend()

        def init():
            p1.set_data([], [])
            p2.set_data([], [])
            p3.set_data([], [])
            p4.set_data([], [])
            p5.set_data([], [])
            return p1, p2, p3, p4, p5

        def update(frame):
            p1.set_data([self.x1[frame]], [self.y1[frame]])
            p2.set_data([self.x2[frame]], [self.y2[frame]])
            p3.set_data([self.x3[frame]], [self.y3[frame]])
            p4.set_data([self.x4[frame]], [self.y4[frame]])
            p5.set_data([self.x5[frame]], [self.y5[frame]])
            return p1, p2, p3, p4, p5

        ani = animation.FuncAnimation(
            fig,
            update,
            frames=len(self.x1),
            init_func=init,
            interval=100,
            blit=True,
            repeat=False
        )
        plt.show()

if __name__ == "__main__":
    sim = SerialChase()
    sim.simulate_multi_run()
    # sim.animate_run()
        
