# c. There are a number of moving objects, which chase each other in a serial order like A chases B, B chases C, and C chases D etc.
# Each object moves towards its target unmindful of the fact that it itself is being targeted by some other object.
# Depending upon the original location, and speed of motion of the object, each object will take its own time to hit its target.
# As soon as hit occurs, the chase ends.
#
# The initial location of the objects A, B, C, and D are (0,0), (0,10), (0,20), (0,30) respectively and their velocities are
# 30km/hr, 25km/hr, 20 km/hr and 15km/hr respectively.
#
# Object D moves towards a fixed [point] at (30,50), while C moves always in a direction pointing towards D, the object B moves always pointing towards C and object A always pointing towards B. It can be assumed that when the distance between two objects [is] less than 0.005 hit is taken to occur.
#
# Identify, which object will hit the target at first and in what time?

import math
import matplotlib.pyplot as plt

A, B, C, D = (0, 0), (0,10), (0,20), (0,30)
vA, vB, vC, vD = 30, 25, 20, 15
target_d = (30, 50)

def distance(p1, p2):
    return math.sqrt((p1[0] - p2[0])**2 + (p1[1] - p2[1])**2)

t = 0

for i in range(13):
    t += 0.1

    # Move A towards B
    a_to_b = distance(A, B)
    if a_to_b < 0.005:
        print(f"A hits B at time {t:.2f} hours")
        break
    A = (A[0] + vA * 0.1 * (B[0] - A[0]) / a_to_b, A[1] + vA * 0.1 * (B[1] - A[1]) / a_to_b)

    # Move B towards C
    b_to_c = distance(B, C)
    if b_to_c < 0.005:
        print(f"B hits C at time {t:.2f} hours")
        break
    B = (B[0] + vB * 0.1 * (C[0] - B[0]) / b_to_c, B[1] + vB * 0.1 * (C[1] - B[1]) / b_to_c)

    # Move C towards D
    c_to_d = distance(C, D)
    if c_to_d < 0.005:
        print(f"C hits D at time {t:.2f} hours")
        break
    C = (C[0] + vC * 0.1 * (D[0] - C[0]) / c_to_d, C[1] + vC * 0.1 * (D[1] - C[1]) / c_to_d)

    # Move D towards target
    d_to_target = distance(D, target_d)
    if d_to_target < 0.005:
        print(f"D hits the target at time {t:.2f} hours")
        break
    D = (D[0] + vD * 0.1 * (target_d[0] - D[0]) / d_to_target, D[1] + vD * 0.1 * (target_d[1] - D[1]) / d_to_target)

    # Preety-Print
    print(f"Time: {t:.2f} hours,\n A: {A}, B: {B}, C: {C}, D: {D}")


