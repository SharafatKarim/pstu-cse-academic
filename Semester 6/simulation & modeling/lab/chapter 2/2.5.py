import random
import matplotlib.pyplot as plt

class RandomWalkProblem:
    def __init__(self, step_limit=100):
        self.x_pos = 0
        self.y_pos = 0
        self.step_limit = step_limit
        self.history = [(self.x_pos, self.y_pos)]
    
    def run(self):
        for _ in range(self.step_limit):
            ransom_num = random.randint(0, 9)
            if ransom_num <= 5:
                self.y_pos += 1 # Move up
            elif ransom_num <= 8:
                self.x_pos -= 1 # Move left
            else:
                self.x_pos += 1 # Move right
            self.history.append((self.x_pos, self.y_pos))
        return (self.x_pos, self.y_pos)
    
    def plot(self):
        x_vals, y_vals = zip(*self.history)
        plt.plot(x_vals, y_vals, 'ro-')
        plt.title('Random Walk Result')
        plt.xlabel('X Position')
        plt.ylabel('Y Position')
        plt.grid()
        plt.show()

if __name__ == "__main__":
    walk = RandomWalkProblem(step_limit=100)
    walk.run()
    walk.plot()