import numpy as np
import matplotlib.pyplot as plt
import random

class GamblingGame():
    def __init__(self):
        self.iteration = 0
        self.cum_head = 0
        self.cum_tail = 0

    def run_game(self):
        self.reset()
        while True:
            self.iteration += 1
            toss = random.randint(0, 1)
            if toss == 0:
                self.cum_head += 1
            else:
                self.cum_tail += 1

            if abs(self.cum_head - self.cum_tail) == 3:
                return 8 - self.iteration

    def reset(self):
        self.iteration = 0
        self.cum_head = 0
        self.cum_tail = 0

game = GamblingGame()

rev = 0
history = []

for i in range(100):
    rev += game.run_game()
    history.append(rev)

print("Revenue : ", rev)

plt.plot(history)
plt.show()
