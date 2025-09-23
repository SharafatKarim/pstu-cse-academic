import random
import math

class Board:
    def __init__(self, size=8):
        self.size = size
        # Each index is a column, value is the row of the queen
        self.state = [random.randint(0, size - 1) for _ in range(size)]

    def conflicts(self, state=None):
        """Count how many pairs of queens attack each other."""
        if state is None:
            state = self.state
        attacks = 0
        for i in range(self.size):
            for j in range(i + 1, self.size):
                # same row or same diagonal
                if state[i] == state[j] or abs(state[i] - state[j]) == abs(i - j):
                    attacks += 1
        return attacks

    def random_neighbor(self):
        new_state = self.state[:]
        col = random.randint(0, self.size - 1)
        new_row = random.randint(0, self.size - 1)
        new_state[col] = new_row
        return new_state


class SimulatedAnnealingSolver:
    def __init__(self, board, temperature=100, cooling_rate=0.99):
        self.board = board
        self.temperature = temperature
        self.cooling_rate = cooling_rate

    def solve(self):
        current = self.board.state
        current_conflicts = self.board.conflicts(current)

        while self.temperature > 0.1 and current_conflicts > 0:
            neighbor = self.board.random_neighbor()
            neighbor_conflicts = self.board.conflicts(neighbor)

            # Difference in conflicts (negative means neighbor is better)
            delta = neighbor_conflicts - current_conflicts

            # Accept if better, or sometimes if worse
            if delta < 0 or random.random() < math.exp(-delta / self.temperature):
                current = neighbor
                current_conflicts = neighbor_conflicts

            # Cool down
            self.temperature *= self.cooling_rate

        self.board.state = current
        return current_conflicts == 0  # True if solved


def print_board(state):
    size = len(state)
    for r in range(size):
        row = ""
        for c in range(size):
            row += "Q " if state[c] == r else ". "
        print(row)
    print()

def simulated_annealing_test(board):
    for i in range(1000):
        solver = SimulatedAnnealingSolver(board)
        if solver.solve():
            print_board(board.state)
            return
    else:
        print("No solution found.")

if __name__ == "__main__":
    board = Board()
    simulated_annealing_test(board)

