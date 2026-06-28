import math
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

def run_exponential_lab():
    mean_days = 100.0
    rate_lambda = 1.0 / mean_days
    target_days = 120.0
    
    # Calculate P(X > 120) = e^(-lambda * x)
    prob_greater_than_120 = math.exp(-rate_lambda * target_days)
    
    print("=" * 55)
    print("Lab 08: COVID-19 Wave Exponential Probability")
    print("=" * 55)
    print(f"Average time between waves (β): {mean_days} days")
    print(f"Rate parameter (λ):             {rate_lambda:.2f} waves/day")
    print(f"Probability wait > 120 days:    {prob_greater_than_120:.4f} ({prob_greater_than_120 * 100:.2f}%)")
    print("=" * 55)

    rates = [0.5, 1.0, 2.0, 4.0]
    sample_size = 10000
    
    plt.figure(figsize=(10, 6))
    
    colors = ['blue', 'orange', 'green', 'red']
    
    for i, rate in enumerate(rates):
        scale_beta = 1.0 / rate
        simulated_data = np.random.exponential(scale=scale_beta, size=sample_size)
        
        # Plot the density of the simulated data
        sns.kdeplot(simulated_data, color=colors[i], label=f'λ = {rate}', linewidth=2, clip=(0, 10))

    # plt.title('Simulated Exponential Distributions with Varying Rates (λ)', fontsize=14)
    # plt.xlabel('Time Between Events (x)', fontsize=12)
    # plt.ylabel('Density (Probability Concentration)', fontsize=12)
    # plt.xlim(0, 8) 
    # plt.legend(title="Rate Parameter", fontsize=11)
    # plt.grid(alpha=0.3)
    
    # plt.tight_layout()
    # plt.show()

run_exponential_lab()

def plot_theoretical_exponential_pdf():
    rates = [0.5, 1.0, 2.0, 4.0]
    colors = ['blue', 'orange', 'green', 'red']
    
    x_values = np.linspace(0, 8, 500)
    
    plt.figure(figsize=(10, 6))
    
    for i, rate in enumerate(rates):
        y_values = rate * np.exp(-rate * x_values)
        
        plt.plot(x_values, y_values, color=colors[i], label=f'λ = {rate}', linewidth=2)

    # Formatting the graph
    plt.title('Theoretical Exponential PDF Curves', fontsize=14)
    plt.xlabel('Time Between Events (x)', fontsize=12)
    plt.ylabel('Density f(x)', fontsize=12)
    
    # We set limits to clearly see the intersections on the y-axis
    plt.xlim(0, 8)
    plt.ylim(0, 4.2) 
    
    plt.legend(title="Rate Parameter", fontsize=11)
    plt.grid(alpha=0.3)
    
    plt.tight_layout()
    plt.show()

plot_theoretical_exponential_pdf()