import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import gaussian_kde, norm

def run_normal_distribution_lab():
    sample_200 = np.random.normal(loc=100, scale=20, size=200)
    
    bp_data = np.random.normal(loc=80, scale=20, size=5000)
    
    group_1 = np.random.normal(loc=60, scale=10, size=2500)
    group_2 = np.random.normal(loc=110, scale=10, size=2500)
    multimodal_data = np.concatenate([group_1, group_2])

    fig, axes = plt.subplots(1, 3, figsize=(18, 5))

    axes[0].hist(sample_200, bins=15, color='skyblue', edgecolor='black', density=True)
    axes[0].set_title('Random Sample (n=200, µ=100, σ=20)')
    axes[0].set_xlabel('Value')
    axes[0].set_ylabel('Density')
    
    axes[1].hist(bp_data, bins=40, color='lightcoral', edgecolor='black', density=True, alpha=0.7)
    
    xmin, xmax = axes[1].get_xlim()
    x_axis = np.linspace(xmin, xmax, 100)
    theoretical_curve = norm.pdf(x_axis, loc=80, scale=20)
    axes[1].plot(x_axis, theoretical_curve, color='darkred', linewidth=2, label='Theoretical PDF')
    
    axes[1].set_title('Diastolic Blood Pressure (µ=80, σ=20)')
    axes[1].set_xlabel('Blood Pressure')
    axes[1].legend()

    kde_unimodal = gaussian_kde(bp_data)
    kde_multimodal = gaussian_kde(multimodal_data)
    
    x_eval = np.linspace(20, 160, 500)
    axes[2].plot(x_eval, kde_unimodal(x_eval), color='blue', linewidth=2, label='Unimodal (1 Peak)')
    axes[2].plot(x_eval, kde_multimodal(x_eval), color='purple', linewidth=2, label='Multimodal (2 Peaks)')
    axes[2].fill_between(x_eval, kde_multimodal(x_eval), color='purple', alpha=0.1)
    
    axes[2].set_title('Unimodal vs. Multimodal Density Curves')
    axes[2].set_xlabel('Value')
    axes[2].legend()

    plt.tight_layout()
    plt.show()

# Execute the lab
run_normal_distribution_lab()