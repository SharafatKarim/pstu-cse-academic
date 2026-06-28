import numpy as np

def inverse_transform_exponential(rate_lambda, num_variates):
    U = np.random.uniform(0.0, 1.0, num_variates)
    X = -(1.0 / rate_lambda) * np.log(1.0 - U)
    
    return U, X

lambda_parameter = 2.0  # Average rate of 2 events per time unit
n_samples = 10

uniform_decimals, exponential_variates = inverse_transform_exponential(
    rate_lambda=lambda_parameter, 
    num_variates=n_samples
)

# --- Print the Results ---
print("=" * 65)
print("Lab 12: Inverse Transform Method (Exponential)")
print("=" * 65)
print(f"Rate Parameter (λ): {lambda_parameter}")
print("-" * 65)
print(f"{'Sample':<8} | {'Uniform Random (U)':<20} | {'Exponential Variate (X)':<20}")
print("-" * 65)

for i in range(n_samples):
    print(f"{i+1:<8} | {uniform_decimals[i]:<20.6f} | {exponential_variates[i]:<20.6f}")

print("=" * 65)