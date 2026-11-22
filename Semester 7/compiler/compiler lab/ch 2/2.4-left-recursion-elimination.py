"""
Section 2.4 - Parsing: Left-Recursion Elimination
Eliminate direct and indirect left recursion (predictive-parsing preparation).

  Direct:   A -> A alpha | beta    =>   A -> beta A' ; A' -> alpha A' | epsilon
  Indirect: substitute earlier nonterminals into A's productions first.

Grammar input: one line per nonterminal, e.g.  E -> E + T | T
Use 'epsilon' for an empty production. Blank line (or EOF) ends input.
"""
from collections import OrderedDict


def parse_grammar(lines):
    grammar = OrderedDict()
    for line in lines:
        line = line.strip()
        if not line:
            continue
        if "->" not in line:
            raise ValueError(f"bad production: {line}")
        nt, body = [part.strip() for part in line.split("->", 1)]
        for prod in body.split("|"):
            symbols = [] if prod.strip() in ("", "epsilon", "eps") else prod.split()
            grammar.setdefault(nt, []).append(symbols)
    return grammar


def eliminate(grammar):
    g = OrderedDict((nt, [list(p) for p in prods]) for nt, prods in grammar.items())
    nts = list(g)
    for i, a in enumerate(nts):
        for b in nts[:i]:
            rewritten = []
            for prod in g[a]:
                if prod and prod[0] == b:
                    rewritten.extend(bp + prod[1:] for bp in g[b])
                else:
                    rewritten.append(prod)
            g[a] = rewritten

        alpha, beta = [], []
        for prod in g[a]:
            if prod and prod[0] == a:
                alpha.append(prod[1:])
            else:
                beta.append(prod)
        if alpha:
            prime = a + "'"
            while prime in g:
                prime += "'"
            g[a] = [b + [prime] for b in beta]
            g[prime] = [a + [prime] for a in alpha] + [[]]
    return g


def show(grammar):
    for nt, prods in grammar.items():
        print(f"  {nt} -> " + " | ".join(" ".join(p) if p else "epsilon" for p in prods))


if __name__ == "__main__":
    print("Enter the grammar, one nonterminal per line (blank line to finish).")
    print("Example: E -> E + T | T")
    lines = []
    while True:
        try:
            line = input()
        except EOFError:
            break
        if not line.strip():
            break
        lines.append(line)
    if not lines:
        lines = ["E -> E + T | E - T | T", "T -> T * F | T / F | F", "F -> ( E ) | id"]
        print("Using default grammar:")
    try:
        grammar = parse_grammar(lines)
    except ValueError as err:
        print(err)
    else:
        print("\nOriginal grammar:")
        show(grammar)
        print("\nAfter left-recursion elimination:")
        show(eliminate(grammar))
