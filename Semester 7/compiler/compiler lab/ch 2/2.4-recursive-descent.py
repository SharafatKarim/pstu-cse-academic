"""
Section 2.4 - Parsing: Recursive-Descent Parser
One function per nonterminal, a single lookahead token, match(), and explicit
epsilon handling. (The same structure is used in C/Java stub implementations.)

  E  -> T E'
  E' -> + T E' | epsilon
  T  -> F T'
  T' -> * F T' | epsilon
  F  -> id | ( E )
"""


class Parser:
    def __init__(self, tokens):
        self.tokens = tokens
        self.pos = 0
        self.trace = []

    def lookahead(self):
        return self.tokens[self.pos] if self.pos < len(self.tokens) else "$"

    def match(self, expected):
        if self.lookahead() == expected:
            self.pos += 1
            self.trace.append(f"match('{expected}')")
        else:
            raise SyntaxError(f"expected '{expected}', found '{self.lookahead()}'")

    def E(self):
        self.trace.append("E()")
        self.T()
        self.Eprime()

    def Eprime(self):
        self.trace.append("E'()")
        if self.lookahead() == "+":
            self.match("+")
            self.T()
            self.Eprime()
        else:
            self.trace.append("E' -> epsilon")

    def T(self):
        self.trace.append("T()")
        self.F()
        self.Tprime()

    def Tprime(self):
        self.trace.append("T'()")
        if self.lookahead() == "*":
            self.match("*")
            self.F()
            self.Tprime()
        else:
            self.trace.append("T' -> epsilon")

    def F(self):
        self.trace.append("F()")
        if self.lookahead() == "id":
            self.match("id")
        elif self.lookahead() == "(":
            self.match("(")
            self.E()
            self.match(")")
        else:
            raise SyntaxError(f"expected 'id' or '(', found '{self.lookahead()}'")

    def parse(self):
        self.E()
        if self.lookahead() != "$":
            raise SyntaxError(f"unexpected token '{self.lookahead()}'")


if __name__ == "__main__":
    s = input("Enter tokens separated by spaces (or Enter for 'id + id * id'): ").strip()
    tokens = s.split() or ["id", "+", "id", "*", "id"]
    print(f"Input: {' '.join(tokens)}")
    parser = Parser(tokens)
    try:
        parser.parse()
        print("\nCall / match trace:")
        for line in parser.trace:
            print("  " + line)
        print("\nResult: ACCEPTED")
    except SyntaxError as err:
        print("\nCall / match trace:")
        for line in parser.trace:
            print("  " + line)
        print(f"\nResult: REJECTED - {err}")
