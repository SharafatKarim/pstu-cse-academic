import matplotlib.pyplot as plt
import matplotlib.animation as animation
import math

class PurePursuit:
    def __init__(self, target_x, target_y, target_z):
        self.clock = 0

        self.target_x = target_x
        self.target_y = target_y
        self.target_z = target_z

        self.attacker_x = [0]
        self.attacker_y = [50]
        self.attacker_z = [0]

        self.attacker_speed = 20
        self.min_distance = 10

    def run_a(self):
        b_x = self.target_x[self.clock]
        b_y = self.target_y[self.clock]
        b_z = self.target_y[self.clock]

        a_x = self.attacker_x[self.clock]
        a_y = self.attacker_y[self.clock]
        a_z = self.attacker_z[self.clock]

        distance = math.sqrt((a_x-b_x)**2 + (a_y-b_y)**2 + (a_z-b_z)**2)
        print("Iteration -> ", self.clock+1, " distance -> ", distance)
        if distance < self.min_distance:
            return True

        self.attacker_x.append(a_x + self.attacker_speed * (b_x-a_x)/distance )
        self.attacker_y.append(a_y + self.attacker_speed * (b_y-a_y)/distance )
        self.attacker_z.append(a_z + self.attacker_speed * (b_z-a_z)/distance )

        self.clock += 1
        return False

    def simulate(self):
        for _ in range(len(self.target_x)):
            if self.run_a():
                break

    def plot(self):
        fig = plt.figure()
        ax = fig.add_subplot(projection='3d')
        ax.plot(self.target_x, self.target_y, self.target_z)
        ax.plot(self.attacker_x, self.attacker_y, self.attacker_z)
        plt.show()

    def plot_animation(self):
        fig = plt.figure()
        ax = fig.add_subplot(projection='3d')

        fighter, = ax.plot([], [], [])
        bomber, = ax.plot([], [], [])

        ax.set_xlim(0, max(self.target_x + self.attacker_x))
        ax.set_ylim(0, max(self.target_y + self.attacker_y))
        ax.set_zlim(0, max(self.target_z + self.attacker_z))

        def update(i):
            fighter.set_data_3d(self.attacker_x[:i+1], self.attacker_y[:i+1], self.attacker_z[:i+1])
            bomber.set_data_3d(self.target_x[:i+1], self.target_y[:i+1], self.target_z[:i+1])
            return fighter, bomber

        ani = animation.FuncAnimation(fig, update, frames=len(self.attacker_x))
        plt.show()


# Bomber coordinates
xb = [100, 100, 120, 129, 140, 149, 158, 168, 179, 188, 198, 209, 219, 226, 234, 240]
yb = [0, 3, 6, 10, 15, 20, 26, 32, 37, 34, 30, 27, 23, 19, 16, 14]
zb = [0, 5, 10, 15, 20, 25, 28, 30, 32, 30, 28, 25, 20, 15, 10, 5]

purePursuit = PurePursuit(xb, yb, zb)
purePursuit.simulate()
purePursuit.plot_animation()

