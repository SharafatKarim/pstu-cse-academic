import numpy as np
import scipy.stats as stats

def calculate_confidence_interval():
    num_replications = 10
    
    np.random.seed(42)
    replication_results = np.random.normal(loc=15.0, scale=2.5, size=num_replications)
    
    sample_mean = np.mean(replication_results)
    
    sample_std = np.std(replication_results, ddof=1)
    standard_error = sample_std / np.sqrt(num_replications)
    
    # --- 3. Construct the 95% Confidence Interval ---
    confidence_level = 0.95
    degrees_of_freedom = num_replications - 1
    

    t_stat = stats.t.ppf((1 + confidence_level) / 2.0, degrees_of_freedom)
    
    margin_of_error = t_stat * standard_error
    
    lower_bound = sample_mean - margin_of_error
    upper_bound = sample_mean + margin_of_error
    
    # --- Print the Output ---
    print("=" * 60)
    print("Lab 15: 95% Confidence Interval Estimation")
    print("=" * 60)
    print("Individual Replication Outputs (Waiting Times in min):")
    for i, result in enumerate(replication_results):
        print(f"  Run {i+1:<2}: {result:.2f}")
    
    print("-" * 60)
    print(f"Number of Replications (n): {num_replications}")
    print(f"Sample Mean (x̄):            {sample_mean:.2f} min")
    print(f"Standard Deviation (s):     {sample_std:.2f} min")
    print(f"Standard Error (SE):        {standard_error:.2f} min")
    print(f"t-statistic:                {t_stat:.3f}")
    print(f"Margin of Error:          ± {margin_of_error:.2f} min")
    print("-" * 60)
    print(f"95% Confidence Interval:    [{lower_bound:.2f}, {upper_bound:.2f}]")
    print("=" * 60)

calculate_confidence_interval()