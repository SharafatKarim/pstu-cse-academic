import random

class GeneticQueens:
    def __init__(self, size=8, population_size=100, mutation_rate=0.05, max_generations=10000):
        self.size = size
        self.population_size = population_size
        self.mutation_rate = mutation_rate
        self.max_generations = max_generations

    def fitness(self, state):
        """
        Fitness = maximum non-attacking pairs - number of attacking pairs
        Higher fitness is better.
        """
        non_attacks = (self.size * (self.size - 1)) // 2
        attacks = 0
        for i in range(self.size):
            for j in range(i + 1, self.size):
                if state[i] == state[j] or abs(state[i] - state[j]) == abs(i - j):
                    attacks += 1
        return non_attacks - attacks

    def create_individual(self):
        # Each individual is a permutation of 0..7 (one queen per column)
        return [random.randint(0, self.size - 1) for _ in range(self.size)]

    def initial_population(self):
        return [self.create_individual() for _ in range(self.population_size)]

    def selection(self, population):
        """
        Tournament selection: pick two random individuals, return the fitter one.
        """
        a, b = random.sample(population, 2)
        return a if self.fitness(a) > self.fitness(b) else b

    def crossover(self, parent1, parent2):
        """
        Single-point crossover: combine parts of two parents.
        """
        point = random.randint(1, self.size - 2)
        child = parent1[:point] + parent2[point:]
        return child

    def mutate(self, individual):
        """
        Randomly change the row of a queen in one column.
        """
        if random.random() < self.mutation_rate:
            col = random.randint(0, self.size - 1)
            row = random.randint(0, self.size - 1)
            individual[col] = row
        return individual

    def solve(self):
        population = self.initial_population()
        max_fitness = (self.size * (self.size - 1)) // 2  # Perfect score (no attacks)

        for generation in range(self.max_generations):
            # Check if we already have a solution
            for individual in population:
                if self.fitness(individual) == max_fitness:
                    return individual, generation

            # Generate next generation
            new_population = []
            for _ in range(self.population_size):
                parent1 = self.selection(population)
                parent2 = self.selection(population)
                child = self.crossover(parent1, parent2)
                child = self.mutate(child)
                new_population.append(child)

            population = new_population

        return None, self.max_generations  # No solution found


def print_board(state):
    size = len(state)
    for r in range(size):
        row = ""
        for c in range(size):
            row += "Q " if state[c] == r else ". "
        print(row)
    print()


if __name__ == "__main__":
    ga = GeneticQueens(size=8, population_size=4, mutation_rate=0.1)
    solution, generations = ga.solve()

    if solution:
        print(f"Solution found in {generations} generations:\n")
        print_board(solution)
    else:
        print("No solution found.")

