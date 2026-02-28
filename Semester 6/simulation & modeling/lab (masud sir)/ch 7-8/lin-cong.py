import math
import random

import matplotlib.pyplot as plt


def linear_congruential_generator(
    seed,
    a,
    c,
    m,
):
    """
    Lab 08: Generates pseudo-random numbers uniformly distributed between 0 and 1.
    """
    random_numbers = []
    current_x = seed

    for _ in range(num_values):
        current_x = (a * current_x + c) % m
        u = current_x / m
        random_numbers.append(u)

    return random_numbers


def inverse_transform_exponential(uniform_numbers, rate_lambda):
    """
    Lab 09: Transforms uniform U(0,1) numbers into Exponential random variates.
    """
    exponential_variates = []

    for u in uniform_numbers:
        if u == 0:
            u = 0.000001
        x = -(1.0 / rate_lambda) * math.log(u)
        exponential_variates.append(x)

    return exponential_variates


if __name__ == "__main__":
    # --- Parameters ---
    seed_value = 42
    multiplier = 1103515245
    increment = 12345
    modulus = 2**31

    # We increased this to 10,000 so the graph shows a clear, smooth distribution
    num_values_to_generate = 10000
    rate_parameter = 2.0

    # --- Generate the Data ---
    uniform_vals = linear_congruential_generator(
        seed_value, multiplier, increment, modulus, num_values_to_generate
    )
    exp_variates = inverse_transform_exponential(uniform_vals, rate_parameter)

    # --- Plotting the Graphs ---
    print(f"Generated {num_values_to_generate} values. Opening graphs...")

    # Create a figure with 2 subplots side-by-side
    plt.figure(figsize=(12, 5))

    # Plot 1: Lab 08 Output (Uniform Distribution)
    plt.subplot(1, 2, 1)
    plt.hist(uniform_vals, bins=50, color="skyblue", edgecolor="black", density=True)
    plt.title("Lab 08: LCG Uniform Distribution $U(0,1)$")
    plt.xlabel("Generated Value")
    plt.ylabel("Frequency")

    # Plot 2: Lab 09 Output (Exponential Distribution)
    plt.subplot(1, 2, 2)
    plt.hist(exp_variates, bins=50, color="salmon", edgecolor="black", density=True)
    plt.title(f"Lab 09: Exponential Variates ($\lambda$={rate_parameter})")
    plt.xlabel("Generated Value")
    plt.ylabel("Frequency")

    # Adjust layout so titles don't overlap and display the plot
    plt.tight_layout()
    plt.show()
