import matplotlib.pyplot as plt
import math
import numpy as np

def analyze_and_simulate_binomial():
    # --- 1. Identify Parameters ---
    n = 15
    p = 0.90
    q = 1.0 - p
    
    # --- 2. Exact Probability P(X=13) ---
    k = 13
    # Using the Binomial formula: (n choose k) * p^k * q^(n-k)
    prob_13_theoretical = math.comb(n, k) * (p**k) * (q**(n-k))
    
    # --- 3. Theoretical Expected Value and Variance ---
    mu_theoretical = n * p
    var_theoretical = n * p * q
    
    # --- 4. Data Verification (Lab Example Data) ---
    example_data = [14, 13, 15, 12, 14]
    example_mean = np.mean(example_data)
    
    # --- 5. Large Scale Simulation (10,000 batches) ---
    num_batches = 10000
    simulated_batches = np.random.binomial(n=n, p=p, size=num_batches)
    
    sim_mu = np.mean(simulated_batches)
    sim_var = np.var(simulated_batches)
    sim_prob_13 = np.sum(simulated_batches == 13) / num_batches

    # --- Print Results ---
    print("=" * 65)
    print("Lab 05: Network Packet Delivery (Binomial Distribution)")
    print("=" * 65)
    print(f"Parameters: n = {n}, p = {p:.2f}, q = {q:.2f}\n")
    
    print("--- Lab Example Data Verification ---")
    print(f"Example Batches:       {example_data}")
    print(f"Example Data Mean:     {example_mean:.2f}")
    print(f"Theoretical Mean:      {mu_theoretical:.2f}")
    
    print("--- Theoretical vs. 10,000 Batch Simulation ---")
    print(f"{'Metric':<25} | {'Theoretical':<15} | {'Simulated':<15}")
    print("-" * 65)
    print(f"{'Prob of Exactly 13 P(X=13)':<25} | {prob_13_theoretical:<15.4f} | {sim_prob_13:<15.4f}")
    print(f"{'Expected Value (Mean) µ':<25} | {mu_theoretical:<15.4f} | {sim_mu:<15.4f}")
    print(f"{'Variance σ²':<25} | {var_theoretical:<15.4f} | {sim_var:<15.4f}")
    print("=" * 65)

    # plot histogram of simulated batches
    plt.hist(simulated_batches, bins=range(n+2), density=True, alpha=0.7, color='green', edgecolor='black', align='left')
    plt.xticks(range(n+1))
    plt.title(f'Binomial Distribution Simulation (n={n}, p={p}, batches={num_batches})')
    plt.xlabel('Number of Successful Deliveries')
    plt.ylabel('Probability Density')
    plt.grid(axis='y', alpha=0.75)
    plt.show()

# Run the lab program
analyze_and_simulate_binomial()