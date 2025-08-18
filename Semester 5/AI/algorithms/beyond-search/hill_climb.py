import random

def fun(x):
    return - ((x - 2) ** 2) + 4

def hill_climb(fun, init, step=1, iteration=100):
    x = init
    for i in range(iteration):
        if fun(x) < fun(x+step):
            x += step
        elif fun(x) < fun(x-step):
            x -= step
        else:
            break
        print(f"Step {i+1}: f({x}) - f({x+step}) - f({x-step})")
    return x

def hill_climb_random(fun, start=-10, stop=10, step=1, iteration=100):
    x = random.randint(start, stop)
    di = {}
    for i in range(iteration):
        if fun(x) < fun(x+step):
            x += step
        elif fun(x) < fun(x-step):
            x -= step
        else:
            di[x] = fun(x)
            x = random.randint(start, stop)
        print(f"Step {i+1}: f({x}) - f({x+step}) - f({x-step})")
    print(di)
    return [i for i, j in di.items() if j == max(di.values())][0]

# print(hill_climb(fun, random.randint(-10, 10), 1.5))
print(hill_climb_random(fun, -10, 10, 1.5))
