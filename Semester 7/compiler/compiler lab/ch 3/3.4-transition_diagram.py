
"""
Lexer + transition-diagram generator for C-like source code.

1. Tokenizes the input by simulating transition diagrams (DFAs) for
   identifiers, numbers and operators (Dragon Book, Section 3.4 style).
2. Prints a trace: each lexeme, its token, and the states it passed through.
3. Writes a Graphviz .dot file of all diagrams, with the edges that were
   actually used highlighted in red. Renders PNG too if `dot` is installed.

Usage:
    python lexer_diagram.py              # uses the built-in sample
    python lexer_diagram.py file.c       # reads a file
"""
import subprocess
import sys
import shutil
from collections import defaultdict

KEYWORDS = {"if", "else", "while", "for", "return", "int", "float", "char",
            "double", "void", "do", "break", "continue"}


class DFA:
    """edges: (src, label, dst). label is 'letter', 'digit', 'other' or a
    literal character. accept: state -> (token, needs_retract)."""

    def __init__(self, name, edges, accept):
        self.name, self.edges, self.accept = name, edges, accept
        self.out = defaultdict(list)
        for s, lab, d in edges:
            self.out[s].append((lab, d))

    @staticmethod
    def matches(label, c):
        if c is None:
            return False
        if label == "letter":
            return c.isalpha() or c == "_"
        if label == "digit":
            return c.isdigit()
        return label == c

    def step(self, state, c):
        other = None
        for lab, dst in self.out[state]:
            if lab == "other":
                other = dst
            elif self.matches(lab, c):
                return dst
        return other  # None means dead end (fail)

    def run(self, text, pos):
        """Returns (token, lexeme, new_pos, path, edges_used, retracted)
        or None if this diagram fails."""
        state, path, used = 0, [0], []
        i = pos
        while True:
            c = text[i] if i < len(text) else None
            nxt = self.step(state, c)
            if nxt is None:
                return None
            used.append((state, nxt))
            path.append(nxt)
            state = nxt
            if c is not None:
                i += 1
            if state in self.accept:
                token, retract = self.accept[state]
                if retract and c is not None:
                    i -= 1  # forward pointer retraction
                return token, text[pos:i], i, path, used, retract


def build_diagrams():
    ident = DFA("identifier", [
        (0, "letter", 1), (1, "letter", 1), (1, "digit", 1), (1, "other", 2),
    ], {2: ("ID", True)})

    number = DFA("number", [
        (0, "digit", 1), (1, "digit", 1),
        (1, ".", 2), (2, "digit", 3), (3, "digit", 3),
        (1, "E", 4), (3, "E", 4),
        (4, "+", 5), (4, "-", 5), (4, "digit", 6), (5, "digit", 6),
        (6, "digit", 6),
        (1, "other", 7), (3, "other", 8), (6, "other", 9),
    ], {7: ("INT", True), 8: ("FLOAT", True), 9: ("SCI", True)})

    relop = DFA("relational / assignment", [
        (0, "<", 1), (1, "=", 2), (1, "other", 3),
        (0, ">", 4), (4, "=", 5), (4, "other", 6),
        (0, "=", 7), (7, "=", 8), (7, "other", 9),
        (0, "!", 10), (10, "=", 11), (10, "other", 12),
        (0, "&", 13), (13, "&", 14),
        (0, "|", 15), (15, "|", 16),
    ], {14: ("AND", False), 16: ("OR", False),
        2: ("RELOP(LE)", False), 3: ("RELOP(LT)", True),
        5: ("RELOP(GE)", False), 6: ("RELOP(GT)", True),
        8: ("RELOP(EQ)", False), 9: ("ASSIGN", True),
        11: ("RELOP(NE)", False), 12: ("NOT", True)})

    return [ident, number, relop]


PUNCT = {"(": "LPAREN", ")": "RPAREN", "{": "LBRACE", "}": "RBRACE",
         "[": "LBRACK", "]": "RBRACK", ";": "SEMI", ",": "COMMA",
         "+": "PLUS", "-": "MINUS", "*": "STAR", "/": "SLASH", "%": "MOD"}


def tokenize(text, dfas):
    pos, tokens, used_edges = 0, [], defaultdict(int)
    while pos < len(text):
        c = text[pos]
        if c.isspace():                                  # white space
            pos += 1
            continue
        if text.startswith("//", pos):                   # line comment
            pos = text.find("\n", pos)
            pos = len(text) if pos == -1 else pos
            continue
        if text.startswith("/*", pos):                   # block comment
            end = text.find("*/", pos + 2)
            pos = len(text) if end == -1 else end + 2
            continue
        for dfa in dfas:                                 # try each diagram
            res = dfa.run(text, pos)
            if res:
                tok, lex, new_pos, path, used, retracted = res
                if tok == "ID" and lex in KEYWORDS:
                    tok = "KEYWORD"
                tokens.append((lex, tok, dfa.name, path, retracted))
                for e in used:
                    used_edges[(dfa.name, e)] += 1
                pos = new_pos
                break
        else:
            if c in PUNCT:
                tokens.append((c, PUNCT[c], "single char", [], False))
            else:
                tokens.append((c, "ERROR", "-", [], False))
            pos += 1
    return tokens, used_edges


def to_dot(dfas, used_edges):
    lines = ["digraph Lexer {", "  rankdir=LR;", "  node [shape=circle, fontsize=11];"]
    for k, dfa in enumerate(dfas):
        pre = f"d{k}_"
        lines.append(f"  subgraph cluster_{k} {{")
        lines.append(f'    label="{dfa.name}"; style=rounded;')
        states = {s for s, _, _ in dfa.edges} | {d for _, _, d in dfa.edges}
        for s in sorted(states):
            if s in dfa.accept:
                tok, retract = dfa.accept[s]
                star = " *" if retract else ""
                lines.append(f'    {pre}{s} [shape=doublecircle, label="{s}{star}\\n{tok}", fontsize=9];')
            else:
                lines.append(f'    {pre}{s} [label="{s}"];')
        lines.append(f'    {pre}start [shape=point];')
        lines.append(f"    {pre}start -> {pre}0;")
        merged = defaultdict(list)
        for s, lab, d in dfa.edges:
            merged[(s, d)].append(lab)
        for (s, d), labs in merged.items():
            n = used_edges.get((dfa.name, (s, d)), 0)
            label = ",".join(labs).replace('"', '\\"')
            if n:
                lines.append(f'    {pre}{s} -> {pre}{d} [label="{label}  (x{n})", color=red, fontcolor=red, penwidth=2];')
            else:
                lines.append(f'    {pre}{s} -> {pre}{d} [label="{label}"];')
        lines.append("  }")
    lines.append("}")
    return "\n".join(lines)


SAMPLE = """\
int a55 = 5;
"""

if __name__ == "__main__":
    src = open(sys.argv[1]).read() if len(sys.argv) > 1 else SAMPLE
    dfas = build_diagrams()
    tokens, used = tokenize(src, dfas)

    print(f"{'LEXEME':<10}{'TOKEN':<12}{'DIAGRAM':<26}{'STATE PATH':<28}RETRACT")
    for lex, tok, dname, path, retr in tokens:
        p = "->".join(map(str, path)) if path else "-"
        print(f"{lex:<10}{tok:<12}{dname:<26}{p:<28}{'yes' if retr else ''}")

    with open("lexer.dot", "w") as f:
        f.write(to_dot(dfas, used))
    print("\nWrote lexer.dot")
    if shutil.which("dot"):
        subprocess.run(["dot", "-Tpng", "lexer.dot", "-o", "lexer.png"], check=True)
        print("Wrote lexer.png")
    else:
        print("Graphviz not found: paste lexer.dot into https://dreampuf.github.io/GraphvizOnline")
