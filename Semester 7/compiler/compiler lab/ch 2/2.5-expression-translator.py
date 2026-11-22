"""
Section 2.5 - A Translator for Simple Expressions
A single executable translator: expr(), term(), factor() with embedded
semantic actions that print postfix output directly (syntax-directed).

  expr  -> expr + term  { print '+' }
  term  -> term * factor { print '*' }
  factor-> ( expr ) | num { print num }
"""  [*Toolchain:* C99, Flex, Bison, CMake], [],

import re


def translate(s):
    toks = re.findall(r"\d+|[A-Za-z_]\w*|[()+*/-]", s)
    if not toks:
        raise ValueError("empty expression")
    pos = 0
    output = []

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
        if peek() in ("+", "-"):
            op = eat()
            factor()
            if op == "-":
                output.append("neg")
        elif peek() == "(":
            eat("(")
            expr()
            eat(")")
        elif peek() and (peek().isdigit() or peek()[0].isalpha()):
            output.append(eat())
        else:
            raise ValueError(f"unexpected token '{peek()}'")

    def term():
        factor()
        while peek() in ("*", "/"):
            op = eat()
            factor()
            output.append(op)

    def expr():
        term()
        while peek() in ("+", "-"):
            op = eat()
            term()
            output.append(op)

    expr()
    if peek() is not None:
        raise ValueError(f"unexpected token '{peek()}'")
    return output


def evaluate(postfix):
    stack = []
    for tok in postfix:
        if tok.lstrip("-").isdigit() or (tok[0].isalpha() and tok.isidentifier()):
            stack.append(int(tok) if tok.isdigit() else tok)
        elif tok == "neg":
            stack.append(-stack.pop())
        else:
            b, a = stack.pop(), stack.pop()
            stack.append(a + b if tok == "+" else a - b if tok == "-" else
                         a * b if tok == "*" else a / b)
    return stack[0]


if __name__ == "__main__":
    s = input("Enter an expression (or press Enter for '3 + 5 * ( 8 - 2 )'): ").strip() or "3 + 5 * ( 8 - 2 )"
    try:
        postfix = translate(s)
        print(f"\nInfix   : {s}")
        print(f"Postfix : {' '.join(postfix)}")
        if all(t.lstrip('-').isdigit() or t == 'neg' or t in '+-*/' for t in postfix):
            print(f"Value   : {evaluate(postfix)}")
    except (ValueError, IndexError, ZeroDivisionError) as err:
        print(f"Error: {err}")
