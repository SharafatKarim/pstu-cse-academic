import math
import matplotlib.pyplot as plt

def calculate_poisson_pmf(k, lam):
    """
    Manually calculates Poisson PMF: (e^-λ * λ^k) / k!
    """
    return (math.exp(-lam) * (lam**k)) / math.factorial(k)

# 1. Compute probabilities for λ = 5, k = 0 to 10
lambda_5 = 5
print(f"{'Calls (k)':<10} | {'Probability P(X=k)':<20}")
print("-" * 35)

for k in range(11):
    prob = calculate_poisson_pmf(k, lambda_5)
    print(f"{k:<10} | {prob:.6f}")

# 2. Simulation and Graphing for λ = 5, 10, and 15
lambdas = [5, 10, 15]
k_range = range(0, 31)  # Range of calls to show on X-axis

plt.figure(figsize=(10, 6))

for lam in lambdas:
    probabilities = [calculate_poisson_pmf(k, lam) for k in k_range]

    # Plotting the PMF
    plt.hist(probabilities, label=f'λ = {lam} calls/hr')
    # plt.fill_between(k_range, probabilities, alpha=0.1)

# Formatting the graph
plt.title('Poisson Distribution PMF: Manual Simulation', fontsize=14)
plt.xlabel('Number of Calls (k)', fontsize=12)
plt.ylabel('Probability P(X=k)', fontsize=12)
plt.xticks(range(0, 31, 2))
plt.grid(axis='y', linestyle='--', alpha=0.7)
plt.legend()

# Show the plot
plt.show()
