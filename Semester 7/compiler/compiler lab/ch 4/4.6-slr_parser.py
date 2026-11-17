"""
Section 4.6: Simple LR (SLR) Parsing
- Canonical Collection of LR(0) items (closure and GOTO)
- SLR(1) parsing table construction (ACTION and GOTO)
- Simulation of LR parsing moves (State stack, Symbol stack, Input)
"""

class LR0Item:
    def __init__(self, lhs, rhs, dot_pos):
        self.lhs = lhs
        self.rhs = list(rhs)
        self.dot_pos = dot_pos

    def next_symbol(self):
        if self.dot_pos < len(self.rhs):
            return self.rhs[self.dot_pos]
        return None

    def advance(self):
        return LR0Item(self.lhs, self.rhs, self.dot_pos + 1)

    def is_reduce(self):
        return self.dot_pos == len(self.rhs)

    def __eq__(self, other):
        return (self.lhs, self.rhs, self.dot_pos) == (other.lhs, other.rhs, other.dot_pos)

    def __hash__(self):
        return hash((self.lhs, tuple(self.rhs), self.dot_pos))

    def __repr__(self):
        before = " ".join(self.rhs[:self.dot_pos])
        after = " ".join(self.rhs[self.dot_pos:])
        dot = "·"
        rhs_str = f"{before} {dot} {after}".strip()
        return f"{self.lhs} -> {rhs_str}"

def closure_lr0(items, grammar, non_terminals):
    closure = set(items)
    changed = True
    while changed:
        changed = False
        new_items = set()
        for item in closure:
            B = item.next_symbol()
            if B in non_terminals:
                for prod in grammar[B]:
                    rhs = prod.split() if prod != "epsilon" else []
                    new_item = LR0Item(B, rhs, 0)
                    if new_item not in closure:
                        new_items.add(new_item)
        if new_items:
            closure.update(new_items)
            changed = True
    return frozenset(closure)

def goto_lr0(items, symbol, grammar, non_terminals):
    moved = set()
    for item in items:
        if item.next_symbol() == symbol:
            moved.add(item.advance())
    return closure_lr0(moved, grammar, non_terminals)

def items_lr0(augmented_start, grammar, non_terminals, terminals):
    all_symbols = non_terminals + terminals
    start_item = LR0Item(augmented_start, [grammar[augmented_start][0]], 0)
    I0 = closure_lr0([start_item], grammar, non_terminals)

    canonical_collection = [I0]
    transitions = {}

    changed = True
    while changed:
        changed = False
        for i, I in enumerate(list(canonical_collection)):
            for X in all_symbols:
                next_I = goto_lr0(I, X, grammar, non_terminals)
                if next_I:
                    if next_I not in canonical_collection:
                        canonical_collection.append(next_I)
                        changed = True
                    j = canonical_collection.index(next_I)
                    transitions[(i, X)] = j
    return canonical_collection, transitions

def build_slr_table(augmented_start, grammar, non_terminals, terminals, follow):
    C, transitions = items_lr0(augmented_start, grammar, non_terminals, terminals)
    action = {}
    goto_table = {}
    conflicts = []

    # Number the productions for reduce actions
    rules = []
    for nt in non_terminals:
        if nt == augmented_start:
            continue
        for prod in grammar[nt]:
            rules.append((nt, prod.split()))

    for i, I in enumerate(C):
        for item in I:
            if not item.is_reduce():
                a = item.next_symbol()
                if a in terminals:
                    j = transitions.get((i, a))
                    if j is not None:
                        act = f"s{j}"
                        key = (i, a)
                        if key in action and action[key] != act:
                            conflicts.append((key, action[key], act))
                        action[key] = act
            else:
                if item.lhs == augmented_start:
                    action[(i, "$")] = "acc"
                else:
                    rule_idx = rules.index((item.lhs, item.rhs))
                    act = f"r{rule_idx}"
                    for a in follow[item.lhs]:
                        key = (i, a)
                        if key in action and action[key] != act:
                            conflicts.append((key, action[key], act))
                        action[key] = act

        for A in non_terminals:
            j = transitions.get((i, A))
            if j is not None:
                goto_table[(i, A)] = j

    return C, rules, action, goto_table, conflicts

def parse_slr(action, goto_table, rules, tokens):
    state_stack = [0]
    symbol_stack = ["$"]
    input_tokens = list(tokens) + ["$"]
    ip = 0

    print(f"\n{'State Stack':<18} {'Symbol Stack':<18} {'Input':<15} {'Action'}")
    print("-" * 65)

    while True:
        s = state_stack[-1]
        a = input_tokens[ip]

        s_stack_str = " ".join(str(x) for x in state_stack)
        sym_stack_str = " ".join(symbol_stack)
        input_str = " ".join(input_tokens[ip:])

        act = action.get((s, a))
        if not act:
            print(f"{s_stack_str:<18} {sym_stack_str:<18} {input_str:<15} Error (no action for [{s}, '{a}'])")
            return False

        if act.startswith("s"):
            next_state = int(act[1:])
            print(f"{s_stack_str:<18} {sym_stack_str:<18} {input_str:<15} Shift to state {next_state}")
            state_stack.append(next_state)
            symbol_stack.append(a)
            ip += 1
        elif act.startswith("r"):
            rule_idx = int(act[1:])
            lhs, rhs = rules[rule_idx]
            print(f"{s_stack_str:<18} {sym_stack_str:<18} {input_str:<15} Reduce by {lhs} -> {' '.join(rhs)}")
            k = len(rhs)
            for _ in range(k):
                state_stack.pop()
                symbol_stack.pop()
            top_state = state_stack[-1]
            next_state = goto_table[(top_state, lhs)]
            state_stack.append(next_state)
            symbol_stack.append(lhs)
        elif act == "acc":
            print(f"{s_stack_str:<18} {sym_stack_str:<18} {input_str:<15} Accept")
            return True

if __name__ == "__main__":
    print("=== Section 4.6: Simple LR (SLR) Parsing ===")

    # Augmented Expression Grammar:
    # E' -> E
    # E  -> E + T | T
    # T  -> T * F | F
    # F  -> ( E ) | id
    grammar = {
        "E'": ["E"],
        "E": ["E + T", "T"],
        "T": ["T * F", "F"],
        "F": ["( E )", "id"]
    }
    non_terminals = ["E'", "E", "T", "F"]
    terminals = ["+", "*", "(", ")", "id"]

    # Precomputed FOLLOW sets for SLR
    follow = {
        "E": {"+", ")", "$"},
        "T": {"+", "*", ")", "$"},
        "F": {"+", "*", ")", "$"}
    }

    C, rules, action, goto_table, conflicts = build_slr_table(
        "E'", grammar, non_terminals, terminals, follow
    )

    print(f"\nConstructed {len(C)} LR(0) Item Sets.")
    print("Sample Item Set I0:")
    for item in sorted(list(C[0]), key=str):
        print(f"  {item}")

    print("\nNumbered Grammar Rules for Reductions:")
    for idx, (lhs, rhs) in enumerate(rules):
        print(f"  r{idx}: {lhs} -> {' '.join(rhs)}")

    if conflicts:
        print(f"\nSLR Conflicts detected: {conflicts}")
    else:
        print("\nSLR Table has NO conflicts.")

    test_input = ["id", "+", "id", "*", "id"]
    print(f"\n--- SLR Parse Trace for: {' '.join(test_input)} ---")
    parse_slr(action, goto_table, rules, test_input)
