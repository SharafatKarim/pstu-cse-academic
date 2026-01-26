import matplotlib.pyplot as plt

class ChemicalReaction:
    def __init__(self, k1, k2, c1, c2, c3, time_diff=0.1):
        self.k1 = k1  # Rate constant for forward reaction
        self.k2 = k2  # Rate constant for reverse reaction
        self.c1 = c1  # Initial concentration of A
        self.c2 = c2  # Initial concentration of B
        self.c3 = c3  # Initial concentration of C
        self.time_diff = time_diff  # Time step for simulation

        self.time_points = [0]
        self.concentration_A = [c1]
        self.concentration_B = [c2]
        self.concentration_C = [c3]

    def simulate_reaction(self, total_time):
        steps = int(total_time / self.time_diff)
        for step in range(1, steps + 1):
            current_time = step * self.time_diff
            a = self.concentration_A[-1]
            b = self.concentration_B[-1]
            c = self.concentration_C[-1]

            # Calculate changes
            delta_a = (-self.k1 * a * b + self.k2 * c) * self.time_diff
            delta_b = (-self.k1 * a * b + self.k2 * c) * self.time_diff
            delta_c = 2 * (self.k1 * a * b - self.k2 * c) * self.time_diff

            # Update 
            new_a = a + delta_a
            new_b = b + delta_b
            new_c = c + delta_c

            # Append 
            self.time_points.append(current_time)
            self.concentration_A.append(new_a)
            self.concentration_B.append(new_b)
            self.concentration_C.append(new_c)

    def print_results(self):
        print("Time\t[A]\t[B]\t[C]")
        for t, a, b, c in zip(self.time_points, self.concentration_A, self.concentration_B, self.concentration_C):
            print(f"{t:.2f}\t{a:.4f}\t{b:.4f}\t{c:.4f}")

    def plot_concentrations(self):
        plt.plot(self.time_points, self.concentration_A, label='[A]', color='blue')
        plt.plot(self.time_points, self.concentration_B, label='[B]', color='orange')
        plt.plot(self.time_points, self.concentration_C, label='[C]', color='green')
        plt.title('Concentration vs Time')
        plt.xlabel('Time')
        plt.ylabel('Concentration')
        plt.legend()
        plt.grid()
        plt.show()

if __name__ == "__main__":
    reaction = ChemicalReaction(k1=0.025, k2=0.01, c1=50.0, c2=25.0, c3=0.0)
    reaction.simulate_reaction(total_time=15)
    reaction.print_results()
    reaction.plot_concentrations()