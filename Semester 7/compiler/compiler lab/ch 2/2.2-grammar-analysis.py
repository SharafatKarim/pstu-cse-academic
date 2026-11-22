"""
Section 2.2 - Syntax Definition: Grammar Analysis
Given a string, show a leftmost derivation and the corresponding parse tree.

Grammar:
    E -> E + T | E - T | T
    T -> T * F | T / F | F
    F -> ( E ) | num
"""
from collections import deque
from graphviz import Digraph

GRAMMAR = {
    "E": [["E", "+", "T"], ["E", "-", "T"], ["T"]],
    "T": [["T", "*", "F"], ["T", "/", "F"], ["F"]],
    "F": [["(", "E", ")"], ["num"]],
}


def tokenize(text):
    """Turn '2 + 3 * 4' / 'id + id' into grammar tokens (numbers/ids -> num)."""
    result = []
    for tok in text.split():
        if tok.isdigit() or (tok[0].isalpha() and tok.isalnum()):
            result.append("num")
        else:
            result.append(tok)
    return result


def leftmost_derivation(tokens):
    """Breadth-first search for a leftmost derivation of tokens."""
    start = ("E",)
    queue = deque([(start, [])])
    seen = set()
    while queue:
        form, steps = queue.popleft()
        if form in seen:
            continue
        seen.add(form)
        if all(sym not in GRAMMAR for sym in form):
            if list(form) == tokens:
                return steps
            continue
        if len(steps) >= 30:
            continue
        pos = next(i for i, sym in enumerate(form) if sym in GRAMMAR)
        nt = form[pos]
        for prod in GRAMMAR[nt]:
            new_form = form[:pos] + tuple(prod) + form[pos + 1:]
            if len(new_form) <= 14:
                queue.append((new_form, steps + [(nt, prod)]))
    return None


class Node:
    def __init__(self, value, children=None):
        self.value = value
        self.children = children or []

    def is_unexpanded_nt(self):
        return self.value in GRAMMAR and not self.children


def leftmost_leaf(node):
    if node.is_unexpanded_nt():
        return node
    for child in node.children:
        found = leftmost_leaf(child)
        if found:
            return found
    return None


def build_tree(steps):
    root = Node("E")
    for nt, prod in steps:
        leaf = leftmost_leaf(root)
        leaf.children = [Node(sym) for sym in prod]
    return root


def print_tree(node, indent=""):
    print(indent + node.value)
    for child in node.children:
        print_tree(child, indent + "  ")


def draw_tree(node, filename="parse_tree_2_2"):
    dot = Digraph(comment="Parse Tree")
    dot.attr(rankdir="TB")

    counter = [0]

    def add(n):
        node_id = str(counter[0])
        counter[0] += 1
        dot.node(node_id, n.value)
        for child in n.children:
            dot.edge(node_id, add(child))
        return node_id

    add(node)
    path = dot.render(filename, format="png", cleanup=True)
    print(f"\nParse tree image saved to: {path}")


if __name__ == "__main__":
    print("Grammar:")
    for nt, prods in GRAMMAR.items():
        print(f"  {nt} -> " + " | ".join(" ".join(p) for p in prods))

    text = input("\nEnter an expression (or press Enter for 'id + id * id'): ").strip()
    if not text:
        text = "id + id * id"
        print(f"Using default: {text}")

    tokens = tokenize(text)
    steps = leftmost_derivation(tokens)
    if steps is None:
        print(f"\n'{text}' cannot be derived by this grammar.")
    else:
        print("\nLeftmost derivation:")
        form = ["E"]
        print("  " + " ".join(form))
        for nt, prod in steps:
            pos = next(i for i, sym in enumerate(form) if sym in GRAMMAR)
            form[pos:pos + 1] = prod
            print(f"  => {' '.join(form):<24} ({nt} -> {' '.join(prod)})")

        print("\nParse tree:")
        tree = build_tree(steps)
        print_tree(tree)
        draw_tree(tree)
