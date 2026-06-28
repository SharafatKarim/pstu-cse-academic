import math
import matplotlib.pyplot as plt
import numpy as np

def poisson_probability(lam, k):
    """Calculates the theoretical Poisson probability P(X=k)"""
    return ((lam ** k) * math.exp(-lam)) / math.factorial(k)

# --- 1. Compute and print probabilities for lambda = 5 ---
lambda_base = 5
max_calls_to_check = 10

print("=" * 50)
print(f"Lab 06: Poisson Probabilities (Average = {lambda_base} calls/hr)")
print("=" * 50)
print(f"{'Number of Calls (k)':<20} | {'Probability P(X=k)':<20}")
print("-" * 50)

for k in range(max_calls_to_check + 1):
    prob = poisson_probability(lambda_base, k)
    print(f"{k:<20} | {prob:<20.4f}")
print("=" * 50)

# --- 2. Simulate and Plot the PMF Graphs ---
# We will evaluate up to 30 calls to see the full tails of the curves
k_values = np.arange(0, 31)

# Calculate probabilities for the three different rates
pmf_5 = [poisson_probability(5, k) for k in k_values]
pmf_10 = [poisson_probability(10, k) for k in k_values]
pmf_15 = [poisson_probability(15, k) for k in k_values]

# Create the plot
plt.figure(figsize=(12, 6))

# Plotting the three PMFs using stem/bar style
plt.plot(k_values, pmf_5, marker='o', linestyle='-', color='blue', label='λ = 5 calls/hr')
plt.plot(k_values, pmf_10, marker='s', linestyle='-', color='green', label='λ = 10 calls/hr')
plt.plot(k_values, pmf_15, marker='^', linestyle='-', color='red', label='λ = 15 calls/hr')

# Formatting the graph
plt.title('Poisson Distribution: Probability Mass Functions', fontsize=14)
plt.xlabel('Number of Calls in an Hour (k)', fontsize=12)
plt.ylabel('Probability P(X=k)', fontsize=12)
plt.xticks(k_values)
plt.grid(alpha=0.3)
plt.legend(fontsize=12)

# Show the graph
plt.tight_layout()
plt.show()