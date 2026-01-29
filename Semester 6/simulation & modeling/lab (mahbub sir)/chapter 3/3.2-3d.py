import math
from mpl_toolkits.mplot3d import Axes3D

import matplotlib.pyplot as plt

# Fighter coordinates
xf = [0]
yf = [50]
zf = [0]
speed = 20  # Fighter speed
capture_distance = 10  # Distance at which the fighter captures the bomber

# Bomber coordinates
xb = [100, 100, 120, 129, 140, 149, 158, 168, 179, 188, 198, 209, 219, 226, 234, 240]
yb = [0, 3, 6, 10, 15, 20, 26, 32, 37, 34, 30, 27, 23, 19, 16, 14]
zb = [0, 5, 10, 15, 20, 25, 28, 30, 32, 30, 28, 25, 20, 15, 10, 5]

def calc_distance(x1, y1, z1, x2, y2, z2):
    return math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2 + (z2 - z1) ** 2)

def sin_theta(x1, y1, z1, x2, y2, z2):
    return (y2 - y1) / calc_distance(x1, y1, z1, x2, y2, z2)

def cos_theta(x1, y1, z1, x2, y2, z2):
    return (x2 - x1) / calc_distance(x1, y1, z1, x2, y2, z2)

def sin_phi(x1, y1, z1, x2, y2, z2):
    return (z2 - z1) / calc_distance(x1, y1, z1, x2, y2, z2)

def simulate_flight():
    global xf, yf, zf, xb, yb, zb, speed, capture_distance
    iteration = 0

    while True:
        xf = xf + [xf[-1] + speed * cos_theta(xf[-1], yf[-1], zf[-1], xb[iteration], yb[iteration], zb[iteration])]
        yf = yf + [yf[-1] + speed * sin_theta(xf[-1], yf[-1], zf[-1], xb[iteration], yb[iteration], zb[iteration])]
        zf = zf + [zf[-1] + speed * sin_phi(xf[-1], yf[-1], zf[-1], xb[iteration], yb[iteration], zb[iteration])]

        distance = calc_distance(xf[iteration], yf[iteration], zf[iteration], xb[iteration], yb[iteration], zb[iteration])
        print("Iteration:", iteration+1, "Distance:", distance)
        iteration += 1
        if distance <= capture_distance or len(xf) >= len(xb):
            break

def plot_flight():
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    ax.plot(xf, yf, zf, label='Fighter Path', color='blue')
    ax.plot(xb, yb, zb, label='Bomber Path', color='red')
    ax.scatter(xf[-1], yf[-1], zf[-1], color='green', label='Capture Point')
    ax.set_title('Fighter and Bomber Flight Paths (3D)')
    ax.set_xlabel('X Coordinate')
    ax.set_ylabel('Y Coordinate')
    ax.set_zlabel('Z Coordinate')
    ax.legend()
    plt.show()

def plot_fight_animation():
    plt.ion()
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    ax.set_xlim(0, 250)
    ax.set_ylim(0, 100)
    ax.set_zlim(0, 40)
    fighter_line, = ax.plot([], [], [], 'b-', label='Fighter Path')
    bomber_line, = ax.plot([], [], [], 'r-', label='Bomber Path')
    fighter_point, = ax.plot([], [], [], 'bo', label='Fighter')
    bomber_point, = ax.plot([], [], [], 'ro', label='Bomber')
    ax.set_xlabel('X')
    ax.set_ylabel('Y')
    ax.set_zlabel('Z')
    ax.legend()
    ax.grid()

    for i in range(len(xf)):
        fighter_line.set_data(xf[:i+1], yf[:i+1])
        fighter_line.set_3d_properties(zf[:i+1])
        bomber_line.set_data(xb[:i+1], yb[:i+1])
        bomber_line.set_3d_properties(zb[:i+1])
        fighter_point.set_data([xf[i]], [yf[i]])
        fighter_point.set_3d_properties([zf[i]])
        bomber_point.set_data([xb[i]], [yb[i]])
        bomber_point.set_3d_properties([zb[i]])
        plt.pause(0.5)

    plt.ioff()
    plt.show()

simulate_flight()
plot_flight()