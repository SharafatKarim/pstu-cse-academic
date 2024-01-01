# import math
# L = float(input())
# R = float(input())
# C = 0.01
# while C <= 0.1:
#     print("C - ", C, " = ", math.sqrt((1/(L*C)) - ((R*R)/(4*C*C))) )
#     C += 0.01

import math

L = float(input("Enter value for L: "))
R = float(input("Enter value for R: "))
C = 0.01

while C <= 0.1:
    expr = (1/(L*C)) - ((R*R)/(4*C*C))
    if expr >= 0:
        result = math.sqrt(expr)
        print(f"C - {C:.2f} = {result:.2f}")
    else:
        print(f"C - {C:.2f} = math domain error")
    C += 0.01