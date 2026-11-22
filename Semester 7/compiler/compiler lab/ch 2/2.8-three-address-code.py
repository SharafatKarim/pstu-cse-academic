"""
Section 2.8 - Intermediate Code Generation: Three-Address Code
Generates three-address code with temporaries (t1, t2, ...) and labels (L1, L2, ...)
for assignments, if-else, while loops, and boolean expressions with
short-circuit &&, ||, and !.

  if ( c ) S1 else S2   ->  if c goto L1 ; goto L2 ; L1: S1 ; L2: S2
  while ( c ) S         ->  L1: if c goto L2 ; goto L3 ; L2: S ; goto L1 ; L3:
  a && b                ->  evaluate a, branch to next test; then b
"""
import re

TOKEN_RE = re.compile(r"&&|\|\||==|!=|<=|>=|\d+|[A-Za-z_]\w*|[=;(){}+*/<>-]")


class Parser:
    def __init__(self, text):
        self.toks = TOKEN_RE.findall(text)
        self.pos = 0

    def peek(self):
        return self.toks[self.pos] if self.pos < len(self.toks) else None

    def eat(self, expected=None):
        tok = self.peek()
        if expected and tok != expected:
            raise ValueError(f"expected '{expected}', got '{tok}'")
        self.pos += 1
        return tok

    def program(self):
        stmts = []
        while self.peek() is not None:
            stmts.append(self.statement())
        return ("block", stmts)

    def statement(self):
        t = self.peek()
        if t == "if":
            self.eat("if"); self.eat("(")
            cond = self.boolean()
            self.eat(")")
            then = self.statement()
            other = None
            if self.peek() == "else":
                self.eat("else")
                other = self.statement()
            return ("if", cond, then, other)
        if t == "while":
            self.eat("while"); self.eat("(")
            cond = self.boolean()
            self.eat(")")
            return ("while", cond, self.statement())
        if t == "{":
            self.eat("{")
            body = []
            while self.peek() != "}":
                body.append(self.statement())
            self.eat("}")
            return ("block", body)
        name = self.eat()
        self.eat("=")
        value = self.expr()
        self.eat(";")
        return ("assign", name, value)

    def boolean(self):
        node = self.bool_term()
        while self.peek() == "||":
            self.eat("||")
            node = ("or", node, self.bool_term())
        return node

    def bool_term(self):
        node = self.bool_factor()
        while self.peek() == "&&":
            self.eat("&&")
            node = ("and", node, self.bool_factor())
        return node

    def bool_factor(self):
        if self.peek() == "!":
            self.eat("!")
            return ("not", self.bool_factor())
        if self.peek() == "(":
            self.eat("(")
            node = self.boolean()
            self.eat(")")
            return node
        left = self.expr()
        if self.peek() in ("<", "<=", ">", ">=", "==", "!="):
            op = self.eat()
            return ("cmp", left, op, self.expr())
        return ("boolvar", left)          # a bare variable used as a condition

    def expr(self):
        node = self.term()
        while self.peek() in ("+", "-"):
            op = self.eat()
            node = ("bin", op, node, self.term())
        return node

    def term(self):
        node = self.factor()
        while self.peek() in ("*", "/"):
            op = self.eat()
            node = ("bin", op, node, self.factor())
        return node

    def factor(self):
        t = self.peek()
        if t == "(":
            self.eat("(")
            node = self.expr()
            self.eat(")")
            return node
        if t and (t.isdigit() or t[0].isalpha()):
            self.eat()
            return ("num" if t.isdigit() else "id", t)
        raise ValueError(f"unexpected token '{t}'")


class CodeGen:
    def __init__(self):
        self.code = []
        self.temp_count = 0
        self.label_count = 0

    def newtemp(self):
        self.temp_count += 1
        return f"t{self.temp_count}"

    def newlabel(self):
        self.label_count += 1
        return f"L{self.label_count}"

    def emit(self, line):
        self.code.append(line)

    def expr(self, e):
        if e[0] in ("num", "id"):
            return e[1]
        left = self.expr(e[2])
        right = self.expr(e[3])
        place = self.newtemp()
        self.emit(f"{place} = {left} {e[1]} {right}")
        return place

    def boolean(self, b, tlabel, flabel):
        if b[0] == "boolvar":
            place = self.expr(b[1])
            self.emit(f"if {place} goto {tlabel}")
            self.emit(f"goto {flabel}")
        elif b[0] == "cmp":
            left = self.expr(b[1])
            right = self.expr(b[3])
            self.emit(f"if {left} {b[2]} {right} goto {tlabel}")
            self.emit(f"goto {flabel}")
        elif b[0] == "not":
            self.boolean(b[1], flabel, tlabel)
        elif b[0] == "and":
            skip = self.newlabel()
            self.boolean(b[1], skip, flabel)
            self.emit(f"label {skip}")
            self.boolean(b[2], tlabel, flabel)
        elif b[0] == "or":
            skip = self.newlabel()
            self.boolean(b[1], tlabel, skip)
            self.emit(f"label {skip}")
            self.boolean(b[2], tlabel, flabel)

    def statement(self, s):
        kind = s[0]
        if kind == "block":
            for stmt in s[1]:
                self.statement(stmt)
        elif kind == "assign":
            place = self.expr(s[2])
            self.emit(f"{s[1]} = {place}")
        elif kind == "if":
            then_label, else_label, end_label = self.newlabel(), self.newlabel(), self.newlabel()
            self.boolean(s[1], then_label, else_label)
            self.emit(f"label {then_label}")
            self.statement(s[2])
            self.emit(f"goto {end_label}")
            self.emit(f"label {else_label}")
            if s[3]:
                self.statement(s[3])
            self.emit(f"label {end_label}")
        elif kind == "while":
            test, body, end = self.newlabel(), self.newlabel(), self.newlabel()
            self.emit(f"label {test}")
            self.boolean(s[1], body, end)
            self.emit(f"label {body}")
            self.statement(s[2])
            self.emit(f"goto {test}")
            self.emit(f"label {end}")


if __name__ == "__main__":
    default = "if ( a < b ) x = a + b; else x = a - b; while ( x < 10 && !flag ) x = x + 1;"
    s = input(f"Enter statements (or Enter for default):\n{default}\n> ").strip() or default
    try:
        tree = Parser(s).program()
        gen = CodeGen()
        gen.statement(tree)
        print("\nThree-address code:")
        for i, line in enumerate(gen.code, 1):
            print(f"{i:>2}: {line}")
    except ValueError as err:
        print(f"Error: {err}")
