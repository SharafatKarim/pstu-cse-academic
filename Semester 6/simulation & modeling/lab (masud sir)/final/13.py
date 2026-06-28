import numpy as np
import matplotlib.pyplot as plt

def run_inverse_transform_histogram():
    beta = 2.0  
    num_samples = 5000
    
    mu = np.random.uniform(0.0, 1.0, num_samples)
    
    X = -beta * np.log(1.0 - mu)
    
    # --- 3. Calculate Theoretical PDF for Overlay ---
    x_theoretical = np.linspace(0, max(X), 500)
    y_theoretical = (1.0 / beta) * np.exp(-x_theoretical / beta)
    
    # --- 4. Plotting ---
    plt.figure(figsize=(10, 6))
    plt.hist(X, bins=50, density=True, color='skyblue', edgecolor='black', alpha=0.7, label='Simulated Data (Histogram)')
    plt.plot(x_theoretical, y_theoretical, color='red', linewidth=3, label='Theoretical PDF Curve')
    
    plt.title(f'Inverse Transform Method: Exponential Distribution (β = {beta})', fontsize=14)
    plt.xlabel('Generated Random Variates (X)', fontsize=12)
    plt.ylabel('Density', fontsize=12)
    plt.xlim(0, max(X))
    plt.legend(fontsize=11)
    plt.grid(alpha=0.3)
    
    plt.tight_layout()
    plt.show()

run_inverse_transform_histogram()