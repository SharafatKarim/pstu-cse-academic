"""
Section 4.3: Eliminating Left Recursion
- Algorithm: Immediate and Non-immediate Left Recursion Elimination
- Converts left-recursive productions into equivalent right-recursive productions
"""

def eliminate_immediate_left_recursion(non_terminal, productions):
    """
    For rules of form:
      A -> A alpha_1 | A alpha_2 | ... | beta_1 | beta_2 | ...
    Convert to:
      A  -> beta_1 A' | beta_2 A' | ...
      A' -> alpha_1 A' | alpha_2 A' | ... | epsilon
    """
    alphas = []
    betas = []

    for prod in productions:
        symbols = prod.strip().split()
        if symbols and symbols[0] == non_terminal:
            alpha = " ".join(symbols[1:])
            alphas.append(alpha)
        else:
            betas.append(prod.strip())

    if not alphas:
        return {non_terminal: productions}

    new_nt = non_terminal + "'"
    new_A_prods = [f"{b} {new_nt}".strip() for b in betas] if betas else [new_nt]
    new_A_prime_prods = [f"{a} {new_nt}".strip() for a in alphas] + ["epsilon"]

    return {
        non_terminal: new_A_prods,
        new_nt: new_A_prime_prods
    }

def eliminate_general_left_recursion(grammar, non_terminals):
    """
    Dragon Book Algorithm 4.19: Eliminates both immediate and non-immediate left recursion.
    """
    result = {nt: list(grammar[nt]) for nt in non_terminals}

    for i in range(len(non_terminals)):
        Ai = non_terminals[i]
        for j in range(i):
            Aj = non_terminals[j]
            new_prods = []
            for prod in result[Ai]:
                symbols = prod.split()
                if symbols and symbols[0] == Aj:
                    gamma = " ".join(symbols[1:])
                    for delta in result[Aj]:
                        expanded = f"{delta} {gamma}".strip()
                        new_prods.append(expanded)
                else:
                    new_prods.append(prod)
            result[Ai] = new_prods

        imm_res = eliminate_immediate_left_recursion(Ai, result[Ai])
        result[Ai] = imm_res[Ai]
        if Ai + "'" in imm_res:
            result[Ai + "'"] = imm_res[Ai + "'"]

    return result

def parse_grammar_string(line):
    """Parses a line like 'E -> E + T | T' into (LHS, [RHS alternatives])."""
    if "->" in line:
        lhs, rhs = line.split("->", 1)
    elif "::=" in line:
        lhs, rhs = line.split("::=", 1)
    else:
        return None, []
    lhs = lhs.strip()
    alts = [a.strip() for a in rhs.split("|") if a.strip()]
    return lhs, alts

if __name__ == "__main__":
    print("=== Section 4.3: Eliminating Left Recursion ===")
    print("Enter a production rule (or press Enter for default 'E -> E + T | T'):")
    print("Format example: E -> E + T | T")
    user_input = input().strip()

    if not user_input:
        user_input = "E -> E + T | T"
        print(f"Using default: {user_input}")

    lhs, alts = parse_grammar_string(user_input)
    if not lhs:
        print("Invalid grammar format! Expected format: LHS -> RHS1 | RHS2")
    else:
        print(f"\nOriginal Production: {lhs} -> {' | '.join(alts)}")
        res = eliminate_immediate_left_recursion(lhs, alts)
        print("\nTransformed (Right-Recursive) Grammar:")
        for r_nt, r_prods in res.items():
            print(f"  {r_nt} -> {' | '.join(r_prods)}")
