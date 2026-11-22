"""
Section 2.8 - Intermediate Code Generation: Abstract Syntax Trees
Node-creation functions (leaf / unary / binary / assign), then build and print
an AST for a simple assignment. Abstract syntax drops punctuation like ';' and '('.

  assign -> id '=' expr ';'
  expr   -> term (('+'|'-') term)*
  term   -> factor (('*'|'/') factor)*
  factor -> id | num | '(' expr ')'
"""
import re
from graphviz import Digraph


def leaf(value):
    return {"label": value, "children": []}


def unary(op, child):
    return {"label": op, "children": [child]}


def binary(op, left, right):
    return {"label": op, "children": [left, right]}


def assign(name, expr):
    return {"label": "=", "children": [leaf(name), expr]}


def parse(s):
    toks = re.findall(r"\d+|[A-Za-z_]\w*|[()+*/-=;]", s)
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
            node = expr()
            eat(")")
            return node
        if peek() and (peek().isdigit() or peek()[0].isalpha()):
            return leaf(eat())
        raise ValueError(f"unexpected token '{peek()}'")

    def term():
        node = factor()
        while peek() in ("*", "/"):
            op = eat()
            node = binary(op, node, factor())
        return node

    def expr():
        node = term()
        while peek() in ("+", "-"):
            op = eat()
            node = binary(op, node, term())
        return node

    if peek() and peek()[0].isalpha():
        name = eat()
        eat("=")
        root = assign(name, expr())
    else:
        root = expr()
    eat(";")
    if peek() is not None:
        raise ValueError(f"unexpected token '{peek()}'")
    return root


def show(node, indent=""):
    print(indent + node["label"])
    for child in node["children"]:
        show(child, indent + "  ")


def sexpr(node):
    if not node["children"]:
        return node["label"]
    return "(" + node["label"] + " " + " ".join(sexpr(c) for c in node["children"]) + ")"


def draw_tree(node, filename="ast_2_8"):
    dot = Digraph(comment="Abstract Syntax Tree")
    dot.attr(rankdir="TB")
    counter = [0]

    def add(n):
        node_id = str(counter[0])
        counter[0] += 1
        dot.node(node_id, n["label"])
        for child in n["children"]:
            dot.edge(node_id, add(child))
        return node_id

    add(node)
    path = dot.render(filename, format="png", cleanup=True)
    print(f"\nAST image saved to: {path}")


if __name__ == "__main__":
    s = input("Enter an assignment (or press Enter for 'x = a + b * 3;'): ").strip() or "x = a + b * 3;"
    try:
        root = parse(s)
        print(f"\nAST for '{s}':")
        show(root)
        print(f"\nAbstract syntax: {sexpr(root)}")
        draw_tree(root)
    except ValueError as err:
        print(f"Error: {err}")
