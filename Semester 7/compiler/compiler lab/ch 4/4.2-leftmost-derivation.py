"""
Section 4.2: Leftmost Derivations (LMD)
- Focus: Always expanding the leftmost non-terminal symbol first
- Generates step-by-step sentential forms
- Produces a Graphviz visual parse tree for the derivation
"""

from collections import defaultdict

def parse_grammar_input(text_lines):
    grammar = defaultdict(list)
    start_symbol = None
    for line in text_lines:
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        if "->" in line:
            lhs, rhs_all = line.split("->", 1)
        elif "::=" in line:
            lhs, rhs_all = line.split("::=", 1)
        else:
            continue
        lhs = lhs.strip()
        if start_symbol is None:
            start_symbol = lhs
        for alt in rhs_all.split("|"):
            alt = alt.strip()
            symbols = alt.split() if alt != "epsilon" else []
            grammar[lhs].append(symbols)
    return dict(grammar), start_symbol

def find_leftmost_derivation(grammar, start_symbol, target_tokens, max_depth=12):
    non_terminals = set(grammar.keys())
    target_tuple = tuple(target_tokens)
    solutions = []

    def is_only_terminals(symbols):
        return all(s not in non_terminals for s in symbols)

    def dfs(current_form, steps, depth):
        if depth > max_depth or solutions:
            return

        if is_only_terminals(current_form):
            if tuple(current_form) == target_tuple:
                solutions.append(list(steps))
            return

        # Prune if terminal prefix doesn't match target
        t_idx = 0
        for s in current_form:
            if s not in non_terminals:
                if t_idx >= len(target_tuple) or target_tuple[t_idx] != s:
                    return
                t_idx += 1
            else:
                break

        if sum(1 for s in current_form if s not in non_terminals) > len(target_tuple):
            return

        # Expand leftmost non-terminal
        for idx, sym in enumerate(current_form):
            if sym in non_terminals:
                for prod in grammar[sym]:
                    new_form = current_form[:idx] + prod + current_form[idx+1:]
                    rule_label = f"{sym} -> {' '.join(prod) if prod else 'epsilon'}"
                    dfs(new_form, steps + [(list(new_form), rule_label)], depth + 1)
                break

    dfs([start_symbol], [([start_symbol], "Start")], 0)
    return solutions[0] if solutions else None

def render_parse_tree(derivation_steps, out_filename):
    try:
        from graphviz import Digraph
    except ImportError:
        return None

    dot = Digraph(comment="Leftmost Derivation Parse Tree")
    dot.attr("node", shape="ellipse", fontname="Helvetica", fontsize="10")
    dot.attr("edge", fontname="Helvetica", fontsize="9")

    counter = [0]
    def new_id():
        counter[0] += 1
        return f"n_{counter[0]}"

    root_sym = derivation_steps[0][0][0]
    root_id = new_id()
    dot.node(root_id, root_sym)
    frontier = [(root_sym, root_id)]

    for sentential_form, rule_applied in derivation_steps[1:]:
        if "->" not in rule_applied:
            continue
        lhs, rhs_str = [x.strip() for x in rule_applied.split("->", 1)]
        rhs_tokens = rhs_str.split() if rhs_str != "epsilon" else []

        replace_idx = None
        for i, (sym, nid) in enumerate(frontier):
            if sym == lhs:
                replace_idx = i
                break

        if replace_idx is not None:
            parent_sym, parent_id = frontier[replace_idx]
            new_children = []
            if not rhs_tokens:
                eps_id = new_id()
                dot.node(eps_id, "ε", shape="box", style="rounded")
                dot.edge(parent_id, eps_id)
            else:
                for tok in rhs_tokens:
                    cid = new_id()
                    shape = "ellipse" if tok[0].isupper() else "box"
                    style = "" if shape == "ellipse" else 'style="rounded"'
                    dot.node(cid, tok, shape=shape)
                    dot.edge(parent_id, cid)
                    new_children.append((tok, cid))

            frontier = frontier[:replace_idx] + new_children + frontier[replace_idx+1:]

    try:
        return dot.render(out_filename, format="png", cleanup=True)
    except Exception:
        return None

if __name__ == "__main__":
    print("=== Section 4.2: Leftmost Derivation (LMD) ===")

    # Textbook expression grammar
    default_grammar = [
        "E -> E + T | T",
        "T -> T * F | F",
        "F -> ( E ) | id"
    ]
    grammar, start_symbol = parse_grammar_input(default_grammar)

    print("Grammar:")
    for nt, prods in grammar.items():
        print(f"  {nt} -> {' | '.join(' '.join(p) if p else 'epsilon' for p in prods)}")

    print("\nEnter input string of tokens (or press Enter for 'id + id * id'):")
    target_str = input().strip()
    if not target_str:
        target_str = "id + id * id"
        print(f"Using default: {target_str}")

    tokens = target_str.split()
    lmd = find_leftmost_derivation(grammar, start_symbol, tokens)

    if not lmd:
        print(f"Cannot derive '{target_str}' using the given grammar!")
    else:
        print(f"\nLeftmost Derivation for '{target_str}':")
        for form, rule in lmd:
            print(f"  => {' '.join(form):<25} (by {rule})")

        img = render_parse_tree(lmd, "parse_tree_lmd")
        if img:
            print(f"\n[Graphviz Image Generated]: Saved parse tree to '{img}'")
