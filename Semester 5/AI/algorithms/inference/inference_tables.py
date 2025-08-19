from tabulate import tabulate

N = 2
li = [
        [0, 0],
        [0, 1],
        [1, 0],
        [1, 1]
    ]

def generate_binary_numbers(n):
    return [bin(i)[2:] for i in range(n)]

def bin_to_li(n):
    pass

for i in li:
    i.append(1 if i[0] == 0 else 0)
    i.append(1 if i[1] == 0 else 0)
    i.append(i[0] | i[1])
    i.append(i[0] & i[1])
    i.append(0 if (i[0] == 1 and i[1] == 0) else 1)

print(tabulate(li, tablefmt="fancy_grid", headers=["X", "Y", "not X", "not Y", "OR", "AND", "Implication"]))


print(generate_binary_numbers(4))
