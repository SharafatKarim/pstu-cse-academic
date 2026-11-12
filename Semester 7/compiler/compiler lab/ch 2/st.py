# Expression → Expression + Term
#            | Expression - Term
#            | Term

# Term       → Term * Factor
#            | Term / Factor
#            | Factor

# Factor     → NUMBER
#            | ( Expression )

from graphviz import Digraph
import re

class Node:
    def __init__(self, value, children=None):
        self.value = value
        self.children = children or []


class Parser:
    def __init__(self, expression):
        self.tokens = re.findall(r'\d+|[()+\-*/]', expression)
        self.pos = 0

    def current(self):
        return self.tokens[self.pos] if self.pos < len(self.tokens) else None

    def consume(self):
        token = self.current()
        self.pos += 1
        return token

    def expression(self):
        left = self.term()

        while self.current() in ('+', '-'):
            op = Node(self.consume())
            right = self.term()
            left = Node("Expression", [left, op, right])

        return Node("Expression", [left])

    def term(self):
        left = self.factor()

        while self.current() in ('*', '/'):
            op = Node(self.consume())
            right = self.factor()
            left = Node("Term", [left, op, right])

        return Node("Term", [left])

    def factor(self):
        if self.current() == '(':
            left = Node(self.consume())
            expr = self.expression()
            right = Node(self.consume())  # )

            return Node("Factor", [left, expr, right])

        return Node("Factor", [Node(self.consume())])

    def parse(self):
        root = self.expression()

        if self.current() is not None:
            raise SyntaxError(f"Unexpected token: {self.current()}")

        return root


def draw_tree(root):
    dot = Digraph()
    dot.attr(rankdir="TB")
    dot.attr("node", shape="ellipse")

    count = [0]

    def add_nodes(node, parent=None):
        current = str(count[0])
        count[0] += 1

        dot.node(current, node.value)

        if parent is not None:
            dot.edge(parent, current)

        for child in node.children:
            add_nodes(child, current)

    add_nodes(root)

    dot.render("cst", format="png", cleanup=True)


expression = "11 + 2 * 5"

parser = Parser(expression)
tree = parser.parse()

draw_tree(tree)
