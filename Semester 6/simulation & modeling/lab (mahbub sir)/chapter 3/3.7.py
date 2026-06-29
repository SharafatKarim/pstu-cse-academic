import matplotlib.pyplot as plt
import math

v = [50]
theta = [45 * math.pi / 180]
x = [0]
y = [0]

t = 0.01
k = 1
g = 9.8
m = 30

def get_k(v):
    if v < 320:
        return 0.003
    elif v < 410:
        return 0.005
    elif v < 450:
        return 0.003
    elif v < 600:
        return 0.002
    elif v < 860:
        return 0.0017
    else:
        return 0.00155

print("x -> ", x[-1], " y -> ", y[-1])
for _ in range(1000):
    v.append(v[-1] + ( t * - 9.8 * math.sin(theta[-1]) - k * v[-1]**get_k(v[-1])/ m ))
    theta.append(theta[-1] + ( t * -g * math.cos(theta[-1])/v[-1] ))
    x.append(x[-1] + ( v[-1] * math.cos(theta[-1]) * t ))
    y.append(y[-1] + ( v[-1] * math.sin(theta[-1]) * t ))

    # print("x -> ", x[-1], " y -> ", y[-1])
    if y[-1] < 0:
        break

plt.plot(x, y)
plt.show()
