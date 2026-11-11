# Syntax Tree
# Concrete Syntax Tree (CST) and Abstract Syntax Tree (AST) are two different representations of the structure of source code.
# CST represents the exact syntax of the source code, including all details such as keywords, punctuation, and whitespace. It is a direct representation of the source code's grammar and is often used for parsing and syntax analysis.
# AST, on the other hand, is a simplified representation of the source code's structure, focusing on the essential elements and their relationships. It abstracts away unnecessary details like punctuation and whitespace, providing a more concise and meaningful representation of the code's semantics. ASTs are commonly used in compilers and interpreters for further analysis, optimization, and code generation.

from graphviz import Digraph

# we can define non-terminal symbols as classes and terminal symbols as instances of those classes. The relationships between the symbols can be represented using parent-child relationships in the tree structure.

terminals = ["NUMBER", "PLUS", "MINUS", "MULTIPLY", "DIVIDE", "LPAREN", "RPAREN"]
non_terminals = ["Expression", "Term", "Factor"]

def infix_to_postfix(expression):
    precedence = {"+": 1, "-": 1, "*": 2, "/": 2}
    output = []
    stack = []
    tokens = expression.split()

    for token in tokens:
        if token.isdigit():
            output.append(token)
        elif token in precedence:
            while (
                stack
                and stack[-1] != "("
                and precedence[stack[-1]] >= precedence[token]
            ):
                output.append(stack.pop())
            stack.append(token)
        elif token == "(":
            stack.append(token)
        elif token == ")":
            while stack and stack[-1] != "(":
                output.append(stack.pop())
            stack.pop()  # Remove '(' from stack

    while stack:
        output.append(stack.pop())

    return output

def draw_cst(expression, filename="cst"):
    dot = Digraph(comment="Concrete Syntax Tree")
    node_id = 0

    def add_node(node):
        nonlocal node_id
        current_id = str(node_id)
        dot.node(current_id, node)
        node_id += 1
        return current_id

    def build_tree(node):
        if isinstance(node, str):
            return add_node(node)
        elif isinstance(node, list):
            parent_id = add_node("Expression")
            for child in node:
                child_id = build_tree(child)
                dot.edge(parent_id, child_id)
            return parent_id

    postfix = infix_to_postfix(expression)
    build_tree(postfix)
    dot.render(filename, format="png", cleanup=True)

if __name__ == "__main__":
    expression = "95 + 5 * (2 - 3)"
    postfix = infix_to_postfix(expression)
    print(f"Infix: {expression}")
    print(f"Postfix: {' '.join(postfix)}")
    draw_cst(expression, filename="cst")    
