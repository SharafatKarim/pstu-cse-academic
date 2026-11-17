"""
Section 4.3: Writing a Grammar
- Eliminating Left Recursion (Immediate and Non-immediate)
- Left Factoring
- Dangling-Else Resolution using Matched and Open Statements
"""

from collections import defaultdict

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
        if prod.startswith(non_terminal):
            # Alpha is everything after the leading non_terminal
            alpha = prod[len(non_terminal):].strip()
            alphas.append(alpha)
        else:
            betas.append(prod.strip())
            
    if not alphas:
        # No left recursion for this non-terminal
        return {non_terminal: productions}
    
    new_nt = non_terminal + "'"
    new_A_prods = [f"{b} {new_nt}".strip() for b in betas] if betas else [new_nt]
    new_A_prime_prods = [f"{a} {new_nt}".strip() for a in alphas] + ["epsilon"]
    
    return {
        non_terminal: new_A_prods,
        new_nt: new_A_prime_prods
    }

def left_factor(non_terminal, productions):
    """
    Finds common prefixes among productions and factors them out.
    A -> alpha beta_1 | alpha beta_2 | gamma
    becomes:
    A  -> alpha A' | gamma
    A' -> beta_1 | beta_2
    """
    # Group by token prefixes
    split_prods = [p.split() for p in productions]
    prefix_groups = defaultdict(list)
    
    for p in split_prods:
        first = p[0] if p else ""
        prefix_groups[first].append(p)
        
    factored_main = []
    new_rules = {}
    
    for first, prods in prefix_groups.items():
        if len(prods) > 1 and first != "":
            # Find longest common prefix
            common_prefix = []
            min_len = min(len(p) for p in prods)
            for idx in range(min_len):
                toks = {p[idx] for p in prods}
                if len(toks) == 1:
                    common_prefix.append(prods[0][idx])
                else:
                    break
            
            c_len = len(common_prefix)
            new_nt = non_terminal + "'"
            factored_main.append(" ".join(common_prefix) + f" {new_nt}")
            
            remainders = []
            for p in prods:
                rem = " ".join(p[c_len:])
                remainders.append(rem if rem else "epsilon")
            new_rules[new_nt] = remainders
        else:
            for p in prods:
                factored_main.append(" ".join(p))
                
    result = {non_terminal: factored_main}
    result.update(new_rules)
    return result

def show_dangling_else_resolution():
    print("--- 3. Dangling-Else Resolution ---")
    print("Ambiguous Grammar:")
    print("  Stmt -> if expr then Stmt | if expr then Stmt else Stmt | other")
    print("\nUnambiguous Grammar (Pairing each 'else' with closest previous unmatched 'if'):")
    print("  Stmt        -> MatchedStmt | OpenStmt")
    print("  MatchedStmt -> if expr then MatchedStmt else MatchedStmt | other")
    print("  OpenStmt    -> if expr then Stmt | if expr then MatchedStmt else OpenStmt")

if __name__ == "__main__":
    print("=== Section 4.3: Writing a Grammar ===")
    
    print("\n--- 1. Eliminating Immediate Left Recursion ---")
    # Example: E -> E + T | T
    e_prods = ["E + T", "T"]
    print(f"Original: E -> {' | '.join(e_prods)}")
    res = eliminate_immediate_left_recursion("E", e_prods)
    for nt, prods in res.items():
        print(f"  {nt} -> {' | '.join(prods)}")

    print("\n--- 2. Left Factoring ---")
    # Example: S -> i E t S | i E t S e S | a
    s_prods = ["i E t S", "i E t S e S", "a"]
    print(f"Original: S -> {' | '.join(s_prods)}")
    factored = left_factor("S", s_prods)
    for nt, prods in factored.items():
        print(f"  {nt} -> {' | '.join(prods)}")

    print()
    show_dangling_else_resolution()
