"""
Section 2.2 - Syntax Definition: Grammar Design
Unambiguous grammars for three notations, with a checker for each.

  1. Postfix arithmetic expressions
  2. Left- / right-associative identifier lists
  3. Arithmetic expressions with unary + and -
"""
import re

OPS = "+-*/"


def check_postfix(s):
    """E -> E E op | num   (operators: + - * /)."""
    stack = 0
    for tok in s.split():
        if tok in OPS:
            if stack < 2:
                return False, "not enough operands for an operator"
            stack -= 1
        elif tok.isdigit() or tok.isalpha():
            stack += 1
        else:
            return False, f"bad token '{tok}'"
    return (stack == 1, "one value left" if stack == 1 else f"{stack} values left")


def check_id_list(s, left):
    """L -> L , id | id  (left)   or   L -> id , L | id  (right)."""
    tokens = [t.strip() for t in s.split(",")]
    if not tokens or any(not re.fullmatch(r"[A-Za-z_]\w*", t) for t in tokens):
        return False, "expected identifiers separated by commas"
    order = "L -> L , id | id" if left else "L -> id , L | id"
    note = "leftmost identifier is the leftmost leaf" if left else "leftmost identifier is the rightmost leaf"
    return True, f"parsed by {order}; {note}"


def tokenize(s):
    return re.findall(r"\d+|[A-Za-z_]\w*|[()+*/-]", s)


def check_unary(s):
    """F -> + F | - F | ( E ) | id ; E,T left-associative as usual."""
    toks = tokenize(s)
    pos = 0

    def peek():
        return toks[pos] if pos < len(toks) else None

    def match(t):
        nonlocal pos
        if peek() == t:
            pos += 1
        else:
            raise ValueError(f"expected '{t}', got '{peek()}'")

    def factor():
        nonlocal pos
        if peek() in ("+", "-"):
            pos += 1
            factor()
        elif peek() == "(":
            match("(")
            expr()
            match(")")
        elif peek() and (peek()[0].isalpha() or peek().isdigit()):
            pos += 1
        else:
            raise ValueError(f"unexpected token '{peek()}'")

    def term():
        factor()
        while peek() in ("*", "/"):
            pos += 1
            factor()

    def expr():
        term()
        while peek() in ("+", "-"):
            pos += 1
            term()

    try:
        expr()
        if peek() is not None:
            return False, f"unexpected trailing token '{peek()}'"
        return True, "parsed with unary +/-, binary + - * /, and parentheses"
    except ValueError as e:
        return False, str(e)


GRAMMARS = {
    "1": ("Postfix expressions",
          "E -> E E + | E E - | E E * | E E / | num", check_postfix),
    "2": ("Identifier lists",
          "Left : L -> L , id | id\nRight: L -> id , L | id",
          lambda s: check_id_list(s, True)),
    "3": ("Arithmetic + unary +/-",
          "E -> E + T | E - T | T\nT -> T * F | T / F | F\nF -> + F | - F | ( E ) | num",
          check_unary),
}

if __name__ == "__main__":
    print("Grammar design problems:")
    for key, (name, grammar, _) in GRAMMARS.items():
        print(f"  {key}. {name}:\n     {grammar.replace(chr(10), chr(10) + '     ')}")

    choice = input("\nChoose a notation [1-3] (or Enter for 1): ").strip() or "1"
    if choice not in GRAMMARS:
        print("Invalid choice.")
    else:
        name, grammar, check = GRAMMARS[choice]
        example = {"1": "3 4 + 5 *", "2": "a, b, c", "3": "-a + b * ( -2 )"}[choice]
        s = input(f"Enter {name.lower()} (or Enter for '{example}'): ").strip() or example
        ok, why = check(s)
        print(f"\nGrammar :\n{grammar}")
        print(f"Input   : {s}")
        print(f"Result  : {'ACCEPTED' if ok else 'REJECTED'} - {why}")
