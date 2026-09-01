from graphviz import Digraph


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


def postfix_to_ast(postfix):
    stack = []
    for token in postfix:
        if token.isdigit():
            stack.append(token)
        else:
            right = stack.pop()
            left = stack.pop()
            node = f"({left} {token} {right})"
            stack.append(node)
    return stack[0]


def draw_ast(ast, filename="ast"):
    dot = Digraph(comment="Abstract Syntax Tree")
    node_id = 0

    def add_node(node):
        nonlocal node_id
        current_id = str(node_id)
        dot.node(current_id, node)
        node_id += 1
        return current_id

    def build_tree(node):
        if isinstance(node, str) and node.startswith("("):
            parts = node[1:-1].split(" ", 2)
            left_id = build_tree(parts[0])
            operator_id = add_node(parts[1])
            right_id = build_tree(parts[2])
            dot.edge(operator_id, left_id)
            dot.edge(operator_id, right_id)
            return operator_id
        else:
            return add_node(node)

    build_tree(ast)
    dot.render(filename, format="png", cleanup=True)


if __name__ == "__main__":
    expression = "95 + 5 * 2"
    postfix = infix_to_postfix(expression)
    ast = postfix_to_ast(postfix)
    print(f"Infix: {expression}")
    print(f"Postfix: {' '.join(postfix)}")
    print(f"AST: {ast}")
    draw_ast(ast, filename="ast")
