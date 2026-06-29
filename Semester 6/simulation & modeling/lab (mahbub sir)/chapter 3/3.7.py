import matplotlib.pyplot as plt
import math

v = [50]
theta = [45]
x = [0]
y = [0]

t = 0.1
k = 1
g = 9.8
m = 30

def get_k(v):
    if v < 320:
        return 3
    elif v < 410:
        return 5
    elif v < 450:
        return 3
    elif v < 600:
        return 2
    elif v < 860:
        return 1.7
    else:
        return 1.55

print("x -> ", x[-1], " y -> ", y[-1])
for _ in range(1000):
    v.append(v[-1] + ( t * - 9.8 * math.sin(theta[-1]) - k * v[-1]**get_k(v[-1])/ m ))
    theta.append(theta[-1] + ( t * -g * math.cos(theta[-1])/v[-1] ))
    x.append(x[-1] + ( v[-1] * math.cos(theta[-1]) * t ))
    y.append(y[-1] + ( v[-1] * math.sin(theta[-1]) * t ))

    print("x -> ", x[-1], " y -> ", y[-1])
    if y == 0:
        break

