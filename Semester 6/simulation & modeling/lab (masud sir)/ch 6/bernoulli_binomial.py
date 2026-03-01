import matplotlib.pyplot as plt
import numpy as np

def linear_congruential_generator(seed, a, c, m, num_values):
    """Generates uniform U(0,1) numbers."""
    random_numbers = []
    current_x = seed
    for _ in range(num_values):
        current_x = (a * current_x + c) % m
        random_numbers.append(current_x / m)
    return random_numbers

def generate_bernoulli(uniform_val, p):
    """
    Lab 03: Generates a single Bernoulli variate.
    Returns 1 with probability p, and 0 with probability 1-p.
    """
    return 1 if uniform_val <= p else 0

def generate_binomial(uniform_vals, n, p):
    """
    Lab 04: Generates a single Binomial variate by simulating 'n' Bernoulli trials.
    """
    # Simply sum the number of successes across 'n' uniform values
    successes = sum(1 for u in uniform_vals if u <= p)
    return successes

if __name__ == "__main__":
    # --- LCG Engine Parameters ---
    seed_value = 12345
    a = 1103515245
    c = 12345
    m = 2**31

    num_samples = 10000 # Number of variates to generate for the plot

    # ==========================================
    # --- Lab 03: Bernoulli Execution ---
    # ==========================================
    p_bernoulli = 0.7
    print(f"Generating {num_samples} Bernoulli variates (p={p_bernoulli})...")

    # We need exactly `num_samples` uniform numbers to run `num_samples` single trials
    u_vals_bernoulli = linear_congruential_generator(seed_value, a, c, m, num_samples)
    bernoulli_variates = [generate_bernoulli(u, p_bernoulli) for u in u_vals_bernoulli]


    # ==========================================
    # --- Lab 04: Binomial Execution ---
    # ==========================================
    n_binomial = 20
    p_binomial = 0.5
    print(f"Generating {num_samples} Binomial variates (n={n_binomial}, p={p_binomial})...")

    # CRITICAL MATH: To generate 1 Binomial variate with n=20, we need 20 uniform numbers.
    # Therefore, to generate 10,000 Binomial variates, we need 200,000 uniform numbers!
    total_u_vals_needed = num_samples * n_binomial
    u_vals_binomial_flat = linear_congruential_generator(seed_value + 1, a, c, m, total_u_vals_needed)

    binomial_variates = []
    for i in range(num_samples):
        # Slice the giant list into smaller chunks of 'n' values
        chunk = u_vals_binomial_flat[i*n_binomial : (i+1)*n_binomial]
        binomial_variates.append(generate_binomial(chunk, n_binomial, p_binomial))


    # ==========================================
    # --- Plotting the Results ---
    # ==========================================
    print("Opening plots...")
    fig, axes = plt.subplots(1, 2, figsize=(12, 5))

    # Plot 1: Lab 03 - Bernoulli
    unique_bern, counts_bern = np.unique(bernoulli_variates, return_counts=True)
    axes[0].bar(unique_bern, counts_bern / num_samples, color=['#FF9999', '#66B2FF'], edgecolor='black', width=0.4)
    axes[0].set_title(f'Lab 03: Bernoulli Distribution (p={p_bernoulli})')
    axes[0].set_xlabel('Outcome (0=Failure, 1=Success)')
    axes[0].set_ylabel('Relative Frequency')
    axes[0].set_xticks([0, 1]) # Lock x-axis ticks to exactly 0 and 1

    # Plot 2: Lab 04 - Binomial
    unique_bin, counts_bin = np.unique(binomial_variates, return_counts=True)
    axes[1].bar(unique_bin, counts_bin / num_samples, color='#99FF99', edgecolor='black')
    axes[1].set_title(f'Lab 04: Binomial Distribution (n={n_binomial}, p={p_binomial})')
    axes[1].set_xlabel('Number of Successes')
    axes[1].set_ylabel('Relative Frequency')
    axes[1].set_xticks(range(min(unique_bin), max(unique_bin)+1, 2)) # Adjust tick spacing for readability

    # Show the combined graph!
    plt.tight_layout()
    plt.show()
