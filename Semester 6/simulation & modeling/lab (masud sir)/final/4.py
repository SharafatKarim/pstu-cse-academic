import numpy as np
import matplotlib.pyplot as plt

def simulate_bernoulli_distribution(p_success, num_chips=10000):
    p_failure = 1.0 - p_success
    expected_value = p_success
    theoretical_variance = p_success * p_failure

    simulated_batch = np.random.choice(
        [1, 0], 
        p=[p_success, p_failure], 
        size=num_chips
    )
    
    actual_defects = np.sum(simulated_batch == 0)
    sim_p_failure = actual_defects / num_chips
    
    sim_mean = np.mean(simulated_batch)
    sim_variance = np.var(simulated_batch)

    print("=" * 60)
    print(f"Lab 04: Bernoulli Simulation (Testing {num_chips:,} chips)")
    print("=" * 60)
    
    print(f"{'Metric':<25} | {'Theoretical':<12} | {'Simulated':<12}")
    print("-" * 60)
    print(f"{'Prob of Defect P(X=0)':<25} | {p_failure:<12.4f} | {sim_p_failure:<12.4f}")
    print(f"{'Expected Value E[X]':<25} | {expected_value:<12.4f} | {sim_mean:<12.4f}")
    print(f"{'Variance Var(X)':<25} | {theoretical_variance:<12.4f} | {sim_variance:<12.4f}")
    print("=" * 60)

    # Plot
    plt.hist(simulated_batch, bins=[-0.5, 0.5, 1.5], density=True, alpha=0.7, color='blue', edgecolor='black')
    plt.xticks([0, 1], ['Defective (0)', 'Non-Defective (1)'])
    plt.title(f'Bernoulli Distribution Simulation (p_success={p_success}, num_chips={num_chips})')
    plt.xlabel('Outcome')
    plt.ylabel('Probability Density')
    plt.grid(axis='y', alpha=0.75)
    plt.show()

simulate_bernoulli_distribution(p_success=0.85, num_chips=10000)