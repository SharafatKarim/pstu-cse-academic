import math
import random
import matplotlib.pyplot as plt
import numpy as np

def simulate_exponential(lam):
    """Manually generates a random waiting time."""
    u = random.random()
    # Inverse transform formula
    return -math.log(1 - u) / lam

# Task 1: COVID-19 Probability Calculation
lam_covid = 0.01
prob_more_than_120 = math.exp(-lam_covid * 120)
print(f"Probability wave takes > 120 days: {prob_more_than_120:.4f}")

# Task 2: Simulate different rate parameters (0.5, 1.0, 2.0, 4.0)
rates = [0.5, 1.0, 2.0, 4.0]
x_axis = np.linspace(0, 8, 1000)

plt.figure(figsize=(10, 6))

for r in rates:
    # Theoretical Curve
    y = [r * math.exp(-r * val) for val in x_axis]
    plt.plot(x_axis, y, label=f'λ = {r}')

    # Optional: Generate 1000 random samples to see if they match
    samples = [simulate_exponential(r) for _ in range(1000)]

plt.title('Exponential Distribution: Impact of Rate Parameter (λ)')
plt.xlabel('Time between events (x)')
plt.ylabel('Density')
plt.ylim(0, 2)
plt.legend()
plt.grid(True, alpha=0.3)
plt.show()
