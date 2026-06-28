import numpy as np
import scipy.stats as stats
import math

def calculate_required_replications():
    # --- 1. System & Target Parameters ---
    confidence_level = 0.95
    target_error = 1.5  # We want our final answer to be accurate within +/- 1.5 minutes
    
    z_score = stats.norm.ppf((1 + confidence_level) / 2.0)
    
    # --- 2. Phase 1: The Pilot Run ---
    pilot_n = 15
    print("=" * 65)
    print("Lab 20: Determining the Number of Replications")
    print("=" * 65)
    print("PHASE 1: PILOT RUN")
    print("-" * 65)
    print(f"Executing {pilot_n} initial pilot simulations...")
    
    np.random.seed(42)
    pilot_data = np.random.normal(loc=25.0, scale=6.0, size=pilot_n)
    
    pilot_mean = np.mean(pilot_data)
    pilot_std = np.std(pilot_data, ddof=1)
    
    t_stat_pilot = stats.t.ppf((1 + confidence_level) / 2.0, pilot_n - 1)
    current_error = t_stat_pilot * (pilot_std / np.sqrt(pilot_n))
    
    print(f"Pilot Mean:            {pilot_mean:.2f} mins")
    print(f"Pilot Std Dev (s):     {pilot_std:.2f} mins")
    print(f"Current Error Margin: ± {current_error:.2f} mins")
    
    if current_error <= target_error:
        print("\nTarget precision already achieved! No further runs needed.")
        return

    # --- 3. Phase 2: Calculating Required Runs ---
    # Formula: n* = (z * s / E)^2
    required_n_float = (z_score * pilot_std / target_error) ** 2
    required_n = math.ceil(required_n_float)
    
    additional_runs = required_n - pilot_n
    
    print("\nPHASE 2: CALCULATING REQUIRED SAMPLE SIZE")
    print("-" * 65)
    print(f"Target Error Margin:  ± {target_error:.2f} mins")
    print(f"Total Runs Required:   {required_n}")
    print(f"Additional Runs to do: {additional_runs}")
    
    # --- 4. Phase 3: Executing Remaining Runs ---
    print("\nPHASE 3: FINAL PRODUCTION RUN")
    print("-" * 65)
    print(f"Executing {additional_runs} additional simulations...")
    
    additional_data = np.random.normal(loc=25.0, scale=6.0, size=additional_runs)
    
    final_data = np.concatenate([pilot_data, additional_data])
    final_n = len(final_data)
    
    final_mean = np.mean(final_data)
    final_std = np.std(final_data, ddof=1)
    
    t_stat_final = stats.t.ppf((1 + confidence_level) / 2.0, final_n - 1)
    final_error = t_stat_final * (final_std / np.sqrt(final_n))
    
    lower_bound = final_mean - final_error
    upper_bound = final_mean + final_error
    
    print(f"Final Total Runs (N):  {final_n}")
    print(f"Final Mean:            {final_mean:.2f} mins")
    print(f"Final Error Margin:  ± {final_error:.2f} mins")
    print("-" * 65)
    print(f"FINAL 95% CONFIDENCE INTERVAL: [{lower_bound:.2f}, {upper_bound:.2f}]")
    print("=" * 65)

calculate_required_replications()