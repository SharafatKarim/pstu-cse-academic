# Newton’s Law of Cooling (steady state)
# T=25+0.85×T×e−0.05T

import numpy as np
import matplotlib.pyplot as plt

# Define the function g(T)
def g(T):
    return 25 + 0.85 * T * np.exp(-0.05 * T)

# Initial guess
T0 = 30.0   # starting near room temperature

# Iteration settings
max_iter = 50
tol = 1e-6

# Store iteration values
T_values = [T0]

# Fixed point iteration loop
for i in range(max_iter):
    T_next = g(T_values[-1])
    T_values.append(T_next)
    if abs(T_next - T_values[-2]) < tol:
        break

T_values = np.array(T_values)
iters = np.arange(len(T_values))

# Print results
print(f"Converged in {len(T_values)-1} iterations")
print(f"Equilibrium Temperature = {T_values[-1]:.4f} °C")

# Plot g(T) vs T and y = T
T_plot = np.linspace(20, 60, 300)
plt.figure(figsize=(8,5))
plt.plot(T_plot, g(T_plot), label="y = g(T)")
plt.plot(T_plot, T_plot, '--', label="y = T")
plt.scatter([T_values[-1]], [T_values[-1]], color='red', label="Fixed Point")
plt.xlabel("Temperature (°C)")
plt.ylabel("y")
plt.title("Fixed Point Iteration — Newton’s Law of Cooling Example")
plt.legend()
plt.grid(True)
plt.show()
