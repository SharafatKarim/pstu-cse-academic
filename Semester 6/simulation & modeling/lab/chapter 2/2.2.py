import random
import matplotlib.pyplot as plt
import numpy as np

class GamblingGame:
    def __init__(self):
        self.serial = 0
        self.cum_head = 0
        self.cum_tail = 0

    def run(self):
        while True:
             self.serial += 1
             random_num = random.randint(0, 1)
             if random_num == 0:
                 self.cum_head += 1
             else:
                 self.cum_tail += 1
             diff = abs(self.cum_head - self.cum_tail)
             if diff == 3:
                 return 8 - self.serial

if __name__ == "__main__":
    run = 50
    total_rev = 0

    while run > 0:
        game = GamblingGame()
        total_rev += game.run()
        run -= 1
    
    print("Total rev : ", total_rev)
    