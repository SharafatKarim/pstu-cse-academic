"""
Section 4.4: Top-Down Parsing
- Compute FIRST and FOLLOW sets
- LL(1) Predictive Parsing Table construction & conflict detection
- Stack trace simulation for input strings
- Simple Recursive-Descent Parser
"""

def compute_first(grammar, non_terminals, terminals):
    first = {nt: set() for nt in non_terminals}
    for t in terminals:
        first[t] = {t}
    first["epsilon"] = {"epsilon"}

    changed = True
    while changed:
        changed = False
        for nt in non_terminals:
            for prod in grammar[nt]:
                symbols = prod.split()
                if not symbols or symbols == ["epsilon"]:
                    if "epsilon" not in first[nt]:
                        first[nt].add("epsilon")
                        changed = True
                    continue

                all_have_epsilon = True
                for sym in symbols:
                    sym_first = first.get(sym, {sym})
                    before_len = len(first[nt])
                    first[nt].update(sym_first - {"epsilon"})
                    if len(first[nt]) > before_len:
                        changed = True
                    if "epsilon" not in sym_first:
                        all_have_epsilon = False
                        break

                if all_have_epsilon:
                    if "epsilon" not in first[nt]:
                        first[nt].add("epsilon")
                        changed = True
    return first

def first_of_sequence(symbols, first):
    if not symbols or symbols == ["epsilon"]:
        return {"epsilon"}
    res = set()
    all_have_epsilon = True
    for s in symbols:
        s_first = first.get(s, {s})
        res.update(s_first - {"epsilon"})
        if "epsilon" not in s_first:
            all_have_epsilon = False
            break
    if all_have_epsilon:
        res.add("epsilon")
    return res

def compute_follow(grammar, start_symbol, non_terminals, terminals, first):
    follow = {nt: set() for nt in non_terminals}
    follow[start_symbol].add("$")

    changed = True
    while changed:
        changed = False
        for nt in non_terminals:
            for prod in grammar[nt]:
                symbols = prod.split()
                if not symbols or symbols == ["epsilon"]:
                    continue

                for i, sym in enumerate(symbols):
                    if sym in non_terminals:
                        beta = symbols[i+1:]
                        beta_first = first_of_sequence(beta, first)
                        
                        before_len = len(follow[sym])
                        follow[sym].update(beta_first - {"epsilon"})
                        
                        if "epsilon" in beta_first or not beta:
                            follow[sym].update(follow[nt])
                            
                        if len(follow[sym]) > before_len:
                            changed = True
    return follow

def build_ll1_table(grammar, non_terminals, terminals, first, follow):
    table = {}
    conflicts = []

    for nt in non_terminals:
        for prod in grammar[nt]:
            symbols = prod.split()
            first_alpha = first_of_sequence(symbols, first)

            for term in (first_alpha - {"epsilon"}):
                key = (nt, term)
                if key in table and table[key] != prod:
                    conflicts.append((key, table[key], prod))
                table[key] = prod

            if "epsilon" in first_alpha:
                for term in follow[nt]:
                    key = (nt, term)
                    if key in table and table[key] != prod:
                        conflicts.append((key, table[key], prod))
                    table[key] = prod

    return table, conflicts

def trace_ll1_parse(table, start_symbol, tokens):
    stack = ["$", start_symbol]
    input_tokens = tokens + ["$"]
    ip = 0

    print(f"\n{'Stack':<25} {'Input':<20} {'Action'}")
    print("-" * 65)

    while stack:
        top = stack[-1]
        current_input = input_tokens[ip]

        stack_str = " ".join(stack)
        input_str = " ".join(input_tokens[ip:])

        if top == current_input:
            if top == "$":
                print(f"{stack_str:<25} {input_str:<20} Accept")
                return True
            print(f"{stack_str:<25} {input_str:<20} Match '{top}'")
            stack.pop()
            ip += 1
        elif (top, current_input) in table:
            prod = table[(top, current_input)]
            print(f"{stack_str:<25} {input_str:<20} Output {top} -> {prod}")
            stack.pop()
            if prod != "epsilon":
                for sym in reversed(prod.split()):
                    stack.append(sym)
        else:
            print(f"{stack_str:<25} {input_str:<20} Error: no rule for ({top}, {current_input})")
            return False

if __name__ == "__main__":
    print("=== Section 4.4: Top-Down Parsing (LL(1)) ===")

    # Standard expression grammar without left recursion:
    # E  -> T E'
    # E' -> + T E' | epsilon
    # T  -> F T'
    # T' -> * F T' | epsilon
    # F  -> ( E ) | id
    grammar = {
        "E": ["T E'"],
        "E'": ["+ T E'", "epsilon"],
        "T": ["F T'"],
        "T'": ["* F T'", "epsilon"],
        "F": ["( E )", "id"]
    }
    non_terminals = ["E", "E'", "T", "T'", "F"]
    terminals = ["+", "*", "(", ")", "id"]

    first = compute_first(grammar, non_terminals, terminals)
    follow = compute_follow(grammar, "E", non_terminals, terminals, first)

    print("\n--- FIRST Sets ---")
    for nt in non_terminals:
        print(f"  FIRST({nt}) = {sorted(list(first[nt]))}")

    print("\n--- FOLLOW Sets ---")
    for nt in non_terminals:
        print(f"  FOLLOW({nt}) = {sorted(list(follow[nt]))}")

    table, conflicts = build_ll1_table(grammar, non_terminals, terminals, first, follow)
    print("\n--- LL(1) Parsing Table ---")
    for (nt, term), prod in sorted(table.items()):
        print(f"  M[{nt}, {term}] = {nt} -> {prod}")

    if conflicts:
        print(f"\nConflicts detected: {conflicts}")
    else:
        print("\nGrammar is strictly LL(1) (No conflicts).")

    # Stack trace for 'id + id * id'
    test_input = ["id", "+", "id", "*", "id"]
    print(f"\n--- Stack Trace for Input: {' '.join(test_input)} ---")
    trace_ll1_parse(table, "E", test_input)
