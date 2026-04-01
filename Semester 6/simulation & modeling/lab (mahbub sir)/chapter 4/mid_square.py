def mid_square(seed, n):
    numbers = []
    for _ in range(n):
        squared = seed ** 2
        squared_str = str(squared).zfill(8)
        
        mid_digits = squared_str[2:6]
        next_seed = int(mid_digits)
        numbers.append(next_seed)

        seed = next_seed
    
    return numbers

print(mid_square(5673, 50))