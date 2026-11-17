"""
Section 4.7: Canonical LR (LR(1)) and LALR(1) Parsers
- LR(1) Items: [A -> alpha . beta, lookahead]
- Closure and GOTO for LR(1)
- LALR(1) Merging of core-equivalent LR(1) item sets
- Comparison of SLR vs LR(1) vs LALR(1)
"""

def first_of_beta_a(beta, a, first):
    """Computes FIRST(beta a)."""
    seq = list(beta) + [a]
    res = set()
    all_eps = True
    for s in seq:
        s_first = first.get(s, {s})
        res.update(s_first - {"epsilon"})
        if "epsilon" not in s_first:
            all_eps = False
            break
    if all_eps:
        res.add("epsilon")
    return res

class LR1Item:
    def __init__(self, lhs, rhs, dot_pos, lookahead):
        self.lhs = lhs
        self.rhs = list(rhs)
        self.dot_pos = dot_pos
        self.lookahead = lookahead

    def next_symbol(self):
        if self.dot_pos < len(self.rhs):
            return self.rhs[self.dot_pos]
        return None

    def advance(self):
        return LR1Item(self.lhs, self.rhs, self.dot_pos + 1, self.lookahead)

    def core(self):
        return (self.lhs, tuple(self.rhs), self.dot_pos)

    def __eq__(self, other):
        return (self.lhs, self.rhs, self.dot_pos, self.lookahead) == \
               (other.lhs, other.rhs, other.dot_pos, other.lookahead)

    def __hash__(self):
        return hash((self.lhs, tuple(self.rhs), self.dot_pos, self.lookahead))

    def __repr__(self):
        before = " ".join(self.rhs[:self.dot_pos])
        after = " ".join(self.rhs[self.dot_pos:])
        dot = "·"
        rhs_str = f"{before} {dot} {after}".strip()
        return f"[{self.lhs} -> {rhs_str}, {self.lookahead}]"

def closure_lr1(items, grammar, non_terminals, first):
    closure = set(items)
    changed = True
    while changed:
        changed = False
        new_items = set()
        for item in closure:
            B = item.next_symbol()
            if B in non_terminals:
                beta = item.rhs[item.dot_pos + 1:]
                lookaheads = first_of_beta_a(beta, item.lookahead, first)
                for prod in grammar[B]:
                    rhs = prod.split() if prod != "epsilon" else []
                    for b in lookaheads:
                        new_item = LR1Item(B, rhs, 0, b)
                        if new_item not in closure:
                            new_items.add(new_item)
        if new_items:
            closure.update(new_items)
            changed = True
    return frozenset(closure)

def goto_lr1(items, symbol, grammar, non_terminals, first):
    moved = set()
    for item in items:
        if item.next_symbol() == symbol:
            moved.add(item.advance())
    return closure_lr1(moved, grammar, non_terminals, first)

def canonical_lr1_items(augmented_start, grammar, non_terminals, terminals, first):
    all_symbols = non_terminals + terminals
    start_item = LR1Item(augmented_start, [grammar[augmented_start][0]], 0, "$")
    I0 = closure_lr1([start_item], grammar, non_terminals, first)

    canonical = [I0]
    changed = True
    while changed:
        changed = False
        for I in list(canonical):
            for X in all_symbols:
                next_I = goto_lr1(I, X, grammar, non_terminals, first)
                if next_I and next_I not in canonical:
                    canonical.append(next_I)
                    changed = True
    return canonical

def merge_lalr_items(lr1_canonical):
    """
    Groups LR(1) item sets that have the exact same core into single LALR(1) states.
    """
    cores = {}
    for idx, I in enumerate(lr1_canonical):
        core_set = frozenset(item.core() for item in I)
        if core_set not in cores:
            cores[core_set] = []
        cores[core_set].append(idx)
    return cores

if __name__ == "__main__":
    print("=== Section 4.7: Canonical LR(1) and LALR(1) Parsers ===")

    # Classic grammar showing LR(1) vs LALR(1) state reduction:
    # S' -> S
    # S  -> C C
    # C  -> c C | d
    grammar = {
        "S'": ["S"],
        "S": ["C C"],
        "C": ["c C", "d"]
    }
    non_terminals = ["S'", "S", "C"]
    terminals = ["c", "d"]
    first = {
        "S'": {"c", "d"},
        "S": {"c", "d"},
        "C": {"c", "d"},
        "c": {"c"},
        "d": {"d"},
        "$": {"$"}
    }

    lr1_states = canonical_lr1_items("S'", grammar, non_terminals, terminals, first)
    lalr_merged = merge_lalr_items(lr1_states)

    print(f"\n1. Canonical LR(1) States Count : {len(lr1_states)}")
    print(f"2. Merged LALR(1) States Count   : {len(lalr_merged)}")

    print("\n--- Core Merging Details for LALR(1) ---")
    for core_idx, (core, state_indices) in enumerate(lalr_merged.items()):
        print(f"  LALR State {core_idx}: merged LR(1) states {state_indices}")

    print("\n--- Summary Comparison ---")
    print("  SLR(1)   : Uses LR(0) items + FOLLOW sets. Smallest table, but weakest lookahead.")
    print("  LR(1)    : Uses LR(0) items + individual lookahead tokens. Most powerful, largest table.")
    print("  LALR(1)  : Merges LR(1) states with identical cores. Same state count as SLR,")
    print("             almost as powerful as full LR(1). Can spontaneously introduce Reduce-Reduce conflicts,")
    print("             but never Shift-Reduce conflicts.")
