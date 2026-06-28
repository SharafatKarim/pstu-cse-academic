import numpy as np
import scipy.stats as stats

def evaluate_empirical_fits():
    # --- 1. Generate Raw Call Center Arrival Times ---
    np.random.seed(42)
    raw_data = np.random.lognormal(mean=1.5, sigma=0.6, size=500)

    print("=" * 60)
    print("Lab 09: MLE Distribution Fitting and Log-Likelihood")
    print("=" * 60)

    norm_params = stats.norm.fit(raw_data)
    norm_log_likelihood = np.sum(stats.norm.logpdf(raw_data, *norm_params))
    
    print(f"Normal Distribution:")
    print(f"  Parameters: µ = {norm_params[0]:.2f}, σ = {norm_params[1]:.2f}")
    print(f"  Log-Likelihood Score: {norm_log_likelihood:.2f}\n")

    weibull_params = stats.weibull_min.fit(raw_data)
    weibull_log_likelihood = np.sum(stats.weibull_min.logpdf(raw_data, *weibull_params))
    
    print(f"Weibull Distribution:")
    print(f"  Parameters: shape = {weibull_params[0]:.2f}, scale = {weibull_params[2]:.2f}")
    print(f"  Log-Likelihood Score: {weibull_log_likelihood:.2f}\n")

    lognorm_params = stats.lognorm.fit(raw_data)
    lognorm_log_likelihood = np.sum(stats.lognorm.logpdf(raw_data, *lognorm_params))
    
    print(f"Lognormal Distribution:")
    print(f"  Parameters: shape = {lognorm_params[0]:.2f}, scale = {lognorm_params[2]:.2f}")
    print(f"  Log-Likelihood Score: {lognorm_log_likelihood:.2f}")
    print("=" * 60)

    scores = {
        "Normal": norm_log_likelihood,
        "Weibull": weibull_log_likelihood,
        "Lognormal": lognorm_log_likelihood
    }
    
    winner = max(scores, key=scores.get)
    print(f"WINNING DISTRIBUTION: {winner} (Highest Score: {scores[winner]:.2f})")
    print("=" * 60)

evaluate_empirical_fits()