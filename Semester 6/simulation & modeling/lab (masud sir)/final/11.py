def linear_congruential_generator(seed, num_values):
    x = seed
    a = 1664525
    c = 1013904223
    m = 2**32  # 4,294,967,296
    
    random_integers = []
    random_decimals = []
    
    for _ in range(num_values):
        x = (a * x + c) % m
        
        random_integers.append(x)
        
        decimal_value = x / m
        random_decimals.append(decimal_value)
        
    return random_integers, random_decimals

# --- Run the Generator ---
seed_value = 42  # The initial starting point
numbers_to_generate = 10

integers, decimals = linear_congruential_generator(seed=seed_value, num_values=numbers_to_generate)

# --- Print the Results ---
print("=" * 60)
print(f"Lab 11: Linear Congruential Generator (LCG)")
print("=" * 60)
print(f"Initial Seed: {seed_value}")
print("-" * 60)
print(f"{'Iteration':<12} | {'Raw Integer (X)':<18} | {'Scaled Decimal (U)':<18}")
print("-" * 60)

for i in range(numbers_to_generate):
    print(f"Step {i+1:<7} | {integers[i]:<18} | {decimals[i]:<18.6f}")
    
print("=" * 60)