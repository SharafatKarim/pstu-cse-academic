"""
Section 2.3 - Syntax-Directed Translation
Annotated parse tree: each node shows the production used and its synthesized
attribute .val (the postfix translation of that subtree).

  E -> E1 + T   E.val = E1.val || T.val || '+'
  T -> T1 * F   T.val = T1.val || F.val || '*'
  F -> ( E )    F.val = E.val
  F -> num      F.val = num.lexeme
"""
import re
from graphviz import Digraph


class Node:
    def __init__(self, label, val="", children=None):
        self.label = label
        self.val = val
        self.children = children or []


def parse(s):
    toks = re.findall(r"\d+|[A-Za-z_]\w*|[()+*/-]", s)
    pos = 0

    def peek():
        return toks[pos] if pos < len(toks) else None

    def eat(expected=None):
        nonlocal pos
        tok = peek()
        if expected and tok != expected:
            raise ValueError(f"expected '{expected}', got '{tok}'")
        pos += 1
        return tok

    def factor():
        if peek() == "(":
            eat("(")
            child = expr()
            eat(")")
            return Node("F -> ( E )", child.val, [child])
        if peek() and (peek().isdigit() or peek()[0].isalpha()):
            return Node("F -> num", eat(), [])
        raise ValueError(f"unexpected token '{peek()}'")

    def term():
        node = factor()
        while peek() in ("*", "/"):
            op = eat()
            right = factor()
            node = Node(f"T -> T {op} F", f"{node.val} {right.val} {op}", [node, right])
        if not node.label.startswith("T ->"):
            node = Node("T -> F", node.val, [node])
        return node

    def expr():
        node = term()
        while peek() in ("+", "-"):
            op = eat()
            right = term()
            node = Node(f"E -> E {op} T", f"{node.val} {right.val} {op}", [node, right])
        if not node.label.startswith("E ->"):
            node = Node("E -> T", node.val, [node])
        return node

    root = expr()
    if peek() is not None:
        raise ValueError(f"unexpected token '{peek()}'")
    return root


def show(node, indent=""):
    print(f"{indent}{node.label:<18} val = {node.val}")
    for child in node.children:
        show(child, indent + "  ")


def draw_tree(node, filename="annotated_parse_tree"):
    dot = Digraph(comment="Annotated Parse Tree")
    dot.attr(rankdir="TB")
    counter = [0]

    def add(n):
        node_id = str(counter[0])
        counter[0] += 1
        dot.node(node_id, f"{n.label}\\nval = {n.val}")
        for child in n.children:
            dot.edge(node_id, add(child))
        return node_id

    add(node)
    path = dot.render(filename, format="png", cleanup=True)
    print(f"\nAnnotated tree image saved to: {path}")


if __name__ == "__main__":
    s = input("Enter an expression (or press Enter for 'a + b * c'): ").strip() or "a + b * c"
    try:
        root = parse(s)
        print(f"\nAnnotated parse tree for '{s}':")
        show(root)
        print(f"\nTranslated string (E.val): {root.val}")
        draw_tree(root)
    except ValueError as err:
        print(f"Error: {err}")
