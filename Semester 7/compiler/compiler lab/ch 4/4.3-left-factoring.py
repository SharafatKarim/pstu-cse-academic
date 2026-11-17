"""
Section 4.3: Left Factoring
- Algorithm: Left Factoring a Context-Free Grammar
- Factors out common prefixes among alternatives to make grammar suitable for predictive LL(1) parsing
"""

from collections import defaultdict

def left_factor(non_terminal, productions):
    """
    Finds common prefixes among productions and factors them out:
      A -> alpha beta_1 | alpha beta_2 | gamma
    becomes:
      A  -> alpha A' | gamma
      A' -> beta_1 | beta_2
    """
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

def parse_grammar_string(line):
    """Parses a line like 'S -> i E t S | i E t S e S | a' into (LHS, [RHS alternatives])."""
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
    print("=== Section 4.3: Left Factoring ===")
    print("Enter a production rule to factor (or press Enter for default 'S -> i E t S | i E t S e S | a'):")
    print("Format example: S -> i E t S | i E t S e S | a")
    user_input = input().strip()

    if not user_input:
        user_input = "S -> i E t S | i E t S e S | a"
        print(f"Using default: {user_input}")

    lhs, alts = parse_grammar_string(user_input)
    if not lhs:
        print("Invalid grammar format! Expected format: LHS -> RHS1 | RHS2")
    else:
        print(f"\nOriginal Production: {lhs} -> {' | '.join(alts)}")
        factored = left_factor(lhs, alts)
        print("\nLeft-Factored Result:")
        for nt, prods in factored.items():
            print(f"  {nt} -> {' | '.join(prods)}")
