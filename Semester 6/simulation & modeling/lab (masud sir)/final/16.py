import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

def run_steady_state_analysis():
    num_products = 1000
    true_steady_state_mean = 45.0
    
    np.random.seed(42)
    product_indices = np.arange(1, num_products + 1)
    
    base_times = true_steady_state_mean - 30.0 * np.exp(-product_indices / 100.0)
    noise = np.random.normal(loc=0.0, scale=5.0, size=num_products)
    
    raw_system_times = base_times + noise
    
    window_size = 50
    df = pd.DataFrame({'Raw_Time': raw_system_times})
    df['Moving_Average'] = df['Raw_Time'].rolling(window=window_size, min_periods=1).mean()

    warmup_cutoff = 300
    biased_mean = np.mean(raw_system_times)
    
    steady_state_data = raw_system_times[warmup_cutoff:]
    steady_state_mean = np.mean(steady_state_data)

    # --- Print Results ---
    print("=" * 60)
    print("Lab 16: Steady-State Analysis & Truncation")
    print("=" * 60)
    print(f"Total Products Simulated:    {num_products}")
    print(f"Warm-up Cutoff Point:        Product #{warmup_cutoff}")
    print("-" * 60)
    print(f"Biased Mean (All Data):      {biased_mean:.2f} mins")
    print(f"Steady-State Mean (Deleted): {steady_state_mean:.2f} mins")
    print(f"True Mathematical Target:    {true_steady_state_mean:.2f} mins")
    print("=" * 60)

    # --- 4. Plot the Analysis ---
    plt.figure(figsize=(12, 6))
    
    plt.plot(product_indices, raw_system_times, color='lightgray', alpha=0.6, label='Raw System Times')
    
    plt.plot(product_indices, df['Moving_Average'], color='blue', linewidth=2, label=f'Moving Average (Window={window_size})')
    
    plt.axvline(x=warmup_cutoff, color='red', linestyle='--', linewidth=2, label=f'Warm-up Cutoff (n={warmup_cutoff})')
    
    plt.axhline(y=steady_state_mean, color='green', linestyle='-', linewidth=2, label=f'Calculated Steady-State Mean')
    
    plt.title('Determining the Warm-Up Period in a Continuous Simulation', fontsize=14)
    plt.xlabel('Product Number (Time)', fontsize=12)
    plt.ylabel('Time in System (Minutes)', fontsize=12)
    plt.legend(loc='lower right')
    plt.grid(alpha=0.3)
    
    plt.tight_layout()
    plt.show()

run_steady_state_analysis()