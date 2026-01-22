import math
import matplotlib.pyplot as plt

# Fighter coordinates
xf = [0]
yf = [50]
speed = 20  # Fighter speed
capture_distance = 10  # Distance at which the fighter captures the bomber

# Bomber coordinates
xb = [100, 100, 120, 129, 140, 149, 158, 168, 179, 188, 198, 209, 219, 226, 234, 240]
yb = [0, 3, 6, 10, 15, 20, 26, 32, 37, 34, 30, 27, 23, 19, 16, 14]

def calc_distance(x1, y1, x2, y2):
    return math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)

def sin_theta(x1, y1, x2, y2):
    return (y2 - y1) / calc_distance(x1, y1, x2, y2)

def cos_theta(x1, y1, x2, y2):
    return (x2 - x1) / calc_distance(x1, y1, x2, y2)

def simulate_flight():
    global xf, yf, xb, yb, speed, capture_distance
    iteration = 0

    while True:
        xf = xf + [xf[-1] + speed * cos_theta(xf[-1], yf[-1], xb[iteration], yb[iteration])]
        yf = yf + [yf[-1] + speed * sin_theta(xf[-1], yf[-1], xb[iteration], yb[iteration])]

        distance = calc_distance(xf[iteration], yf[iteration], xb[iteration], yb[iteration])
        print("Iteration:", iteration+1, "Distance:", distance)
        iteration += 1
        if distance <= capture_distance or len(xf) >= len(xb):
            break

def plot_flight():
    plt.plot(xf, yf, label='Fighter Path', color='blue')
    plt.plot(xb, yb, label='Bomber Path', color='red')
    plt.scatter(xf[-1], yf[-1], color='green', label='Capture Point')
    plt.title('Fighter and Bomber Flight Paths')
    plt.xlabel('X Coordinate')
    plt.ylabel('Y Coordinate')
    plt.legend()
    plt.grid()
    plt.show()

def plot_fight_animation():
    plt.ion()
    fig, ax = plt.subplots()
    ax.set_xlim(0, 250)
    ax.set_ylim(0, 100)
    fighter_line, = ax.plot([], [], 'b-', label='Fighter Path')
    bomber_line, = ax.plot([], [], 'r-', label='Bomber Path')
    fighter_point, = ax.plot([], [], 'bo', label='Fighter')
    bomber_point, = ax.plot([], [], 'ro', label='Bomber')
    ax.legend()
    ax.grid()

    for i in range(len(xf)):
        fighter_line.set_data(xf[:i+1], yf[:i+1])
        bomber_line.set_data(xb[:i+1], yb[:i+1])
        fighter_point.set_data(xf[:i], yf[:i])
        bomber_point.set_data(xb[:i], yb[:i])
        plt.pause(0.5)

    plt.ioff()
    plt.show()

simulate_flight()
# plot_flight()

while True:
    plot_fight_animation()