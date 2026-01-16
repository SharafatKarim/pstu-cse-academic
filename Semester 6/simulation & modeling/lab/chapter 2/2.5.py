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
        return (self.x_pos, self.y_pos)
    
    def plot(self):
        x_vals = [pos[0] for pos in self.history]
        y_vals = [pos[1] for pos in self.history]

        plt.plot(x_vals, y_vals, marker='o')
        plt.title('Random Walk Path')
        plt.xlabel('X Position')
        plt.ylabel('Y Position')
        plt.grid()
        plt.show()

    def multi_run(self, runs=10):
        results = []
        for _ in range(runs):
            result = self.run()
            results.append(result)
            self.x_pos = 0
            self.y_pos = 0
            self.history = [(self.x_pos, self.y_pos)]
        # print("Results of each run: ", results)

        plt.plot([res[0] for res in results], [res[1] for res in results], 'ro', alpha=0.1)
        plt.title('Random Walk End Positions')
        plt.xlabel('X Position')
        plt.ylabel('Y Position')
        plt.xlim(-self.step_limit, self.step_limit)
        plt.ylim(-self.step_limit, self.step_limit)
        plt.grid()
        plt.show()

if __name__ == "__main__":
    walk = RandomWalkProblem(step_limit=100)
    walk.multi_run(1000)