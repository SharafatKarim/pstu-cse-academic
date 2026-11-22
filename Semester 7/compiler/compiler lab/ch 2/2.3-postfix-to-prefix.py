"""
Section 2.3 - Syntax-Directed Translation
SDT: postfix expressions -> prefix expressions (no infix intermediate).

  E -> E1 E2 op    { E.val = op || E1.val || E2.val }
  E -> num         { E.val = num.lexeme }

Stack holds prefix strings. On an operator: pop right, pop left,
push 'op left right'.
"""
OPS = set("+-*/")


def translate(s):
    stack = []
    for tok in s.split():
        if tok in OPS:
            if len(stack) < 2:
                return None, "not enough operands"
            right = stack.pop()
            left = stack.pop()
            stack.append(f"{tok} {left} {right}")
        elif tok.isdigit() or tok.isalpha():
            stack.append(tok)
        else:
            return None, f"bad token '{tok}'"
    if len(stack) != 1:
        return None, f"{len(stack)} values left on stack"
    return stack[0], None


if __name__ == "__main__":
    s = input("Enter a postfix expression (or press Enter for 'a b + c d + *'): ").strip() or "a b + c d + *"
    prefix, error = translate(s)
    print(f"\nPostfix: {s}")
    if error:
        print(f"Error  : {error}")
    else:
        print(f"Prefix : {prefix}")
