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

if __name__ == "__main__":
    expression = "11 + 2 * 5"
    postfix = infix_to_postfix(expression)
    print(f"Infix: {expression}")
    print(f"Postfix: {' '.join(postfix)}")
