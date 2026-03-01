import numpy as np
import matplotlib.pyplot as plt
import math

# 1. Generate 200 random samples (Mean=100, SD=20)
sample_size = 200
mu_sample = 100
sigma_sample = 20
random_data = np.random.normal(mu_sample, sigma_sample, sample_size)

# 2. Define the Normal Distribution Function
def normal_pdf(x, mu, sigma):
    exponent = math.exp(-((x - mu) ** 2) / (2 * sigma ** 2))
    coefficient = 1 / (sigma * math.sqrt(2 * math.pi))
    return coefficient * exponent

# Values for the X-axis (covering the range of blood pressure)
x = np.linspace(0, 160, 1000)

# Unimodal Curve (Men's Blood Pressure: Mean 80, SD 20)
unimodal = [normal_pdf(val, 80, 20) for val in x]

# Multimodal Curve (Combining two different groups)
# Group A: Mean 60, SD 10 | Group B: Mean 110, SD 15
multimodal = [(normal_pdf(val, 60, 10) + normal_pdf(val, 110, 15)) / 2 for val in x]

# --- Plotting ---
plt.figure(figsize=(10, 6))

# Histogram of the random sample
plt.hist(random_data, bins=20, density=True, alpha=0.3, color='gray', label='Random Sample (n=200)')

# Density Curves
plt.plot(x, unimodal, label='Unimodal (BP Mean=80)', linewidth=2, color='blue')
plt.plot(x, multimodal, label='Multimodal (Mixed Groups)', linewidth=2, color='red', linestyle='--')

plt.title('Normal Distribution: Unimodal vs Multimodal')
plt.xlabel('Diastolic Blood Pressure')
plt.ylabel('Density')
plt.legend()
plt.show()
