"""
Section 2.3 - Syntax-Directed Translation
SDT: infix expressions -> prefix notation.

  E  -> E1 + T    { E.val = '+' || E1.val || T.val }
  E  -> E1 - T    { E.val = '-' || E1.val || T.val }
  E  -> T         { E.val = T.val }
  T  -> T1 * F    { T.val = '*' || T1.val || F.val }
  T  -> T1 / F    { T.val = '/' || T1.val || F.val }
  T  -> F         { T.val = F.val }
  F  -> ( E )     { F.val = E.val }
  F  -> num       { F.val = num.lexeme }
"""
import re


def translate(s):
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
            val = expr()
            eat(")")
            return val
        if peek() and (peek().isdigit() or peek()[0].isalpha()):
            return eat()
        raise ValueError(f"unexpected token '{peek()}'")

    def term():
        val = factor()
        while peek() in ("*", "/"):
            op = eat()
            val = op + " " + val + " " + factor()
        return val

    def expr():
        val = term()
        while peek() in ("+", "-"):
            op = eat()
            val = op + " " + val + " " + term()
        return val

    try:
        result = expr()
        if peek() is not None:
            raise ValueError(f"unexpected token '{peek()}'")
        return result, None
    except ValueError as err:
        return None, str(err)


if __name__ == "__main__":
    s = input("Enter an infix expression (or press Enter for 'a + b * c'): ").strip() or "a + b * c"
    prefix, error = translate(s)
    print(f"\nInfix  : {s}")
    if error:
        print(f"Error  : {error}")
    else:
        print(f"Prefix : {prefix}")
