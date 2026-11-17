"""
Section 4.9: Parser Generators (Yacc / Bison equivalent in Python)
- Arithmetic Desktop Calculator supporting variables, parentheses, and arithmetic
- Error handling with panic recovery
- AST / Evaluation construction
"""

import re

class CalculatorParser:
    """
    Demonstrates the mechanics of Yacc/Bison-generated parsers in pure Python:
    Grammar:
      program -> statement_list
      statement -> ID = expr | expr
      expr -> expr + term | expr - term | term
      term -> term * factor | term / factor | factor
      factor -> ( expr ) | - factor | NUMBER | ID
    """
    def __init__(self):
        self.variables = {}

    def tokenize(self, text):
        token_spec = [
            ("NUMBER",   r"\d+(\.\d*)?"),
            ("ID",       r"[a-zA-Z_][a-zA-Z0-9_]*"),
            ("ASSIGN",   r"="),
            ("PLUS",     r"\+"),
            ("MINUS",    r"-"),
            ("TIMES",    r"\*"),
            ("DIVIDE",   r"/"),
            ("LPAREN",   r"\("),
            ("RPAREN",   r"\)"),
            ("SEMI",     r";"),
            ("SKIP",     r"[ \t]+"),
            ("MISMATCH", r"."),
        ]
        tok_regex = "|".join(f"(?P<{pair[0]}>{pair[1]})" for pair in token_spec)
        tokens = []
        for mo in re.finditer(tok_regex, text):
            kind = mo.lastgroup
            val = mo.group()
            if kind == "NUMBER":
                tokens.append((kind, float(val) if "." in val else int(val)))
            elif kind == "SKIP":
                continue
            elif kind == "MISMATCH":
                raise SyntaxError(f"Unexpected character: {val!r}")
            else:
                tokens.append((kind, val))
        tokens.append(("EOF", "$"))
        return tokens

    def parse(self, text):
        tokens = self.tokenize(text)
        pos = 0

        def current():
            return tokens[pos]

        def match(expected_type):
            nonlocal pos
            if current()[0] == expected_type:
                tok = current()
                pos += 1
                return tok
            return None

        # Recursive-descent mimicking precedence levels (Yacc semantics)
        def parse_factor():
            nonlocal pos
            tok = current()
            if tok[0] == "MINUS":
                match("MINUS")
                return -parse_factor()
            elif tok[0] == "NUMBER":
                match("NUMBER")
                return tok[1]
            elif tok[0] == "ID":
                match("ID")
                name = tok[1]
                if name in self.variables:
                    return self.variables[name]
                else:
                    print(f"Warning: Undefined variable '{name}', defaulting to 0")
                    return 0
            elif tok[0] == "LPAREN":
                match("LPAREN")
                val = parse_expr()
                match("RPAREN")
                return val
            else:
                raise SyntaxError(f"Syntax error at {tok}")

        def parse_term():
            val = parse_factor()
            while current()[0] in ("TIMES", "DIVIDE"):
                op = current()[0]
                match(op)
                rhs = parse_factor()
                if op == "TIMES":
                    val *= rhs
                else:
                    if rhs == 0:
                        print("Error: Division by zero")
                        val = float("inf")
                    else:
                        val /= rhs
            return val

        def parse_expr():
            val = parse_term()
            while current()[0] in ("PLUS", "MINUS"):
                op = current()[0]
                match(op)
                rhs = parse_term()
                if op == "PLUS":
                    val += rhs
                else:
                    val -= rhs
            return val

        def parse_statement():
            # Lookahead for assignment: ID = expr
            if current()[0] == "ID" and pos + 1 < len(tokens) and tokens[pos+1][0] == "ASSIGN":
                var_name = match("ID")[1]
                match("ASSIGN")
                val = parse_expr()
                self.variables[var_name] = val
                print(f"Assign: {var_name} = {val}")
                return val
            else:
                val = parse_expr()
                print(f"Result: {val}")
                return val

        # Execute statements separated by semicolons
        while current()[0] != "EOF":
            try:
                parse_statement()
                if current()[0] == "SEMI":
                    match("SEMI")
            except SyntaxError as e:
                print(f"Parser Error: {e}")
                # Panic-mode recovery to next semicolon
                while current()[0] not in ("SEMI", "EOF"):
                    pos += 1
                if current()[0] == "SEMI":
                    match("SEMI")

if __name__ == "__main__":
    print("=== Section 4.9: Calculator Parser with Variable Support & Error Recovery ===")
    calc = CalculatorParser()

    script = """
    x = 10 ;
    y = 20 ;
    z = (x + y) * 2 - 5 ;
    invalid = + * 5 ;
    w = z / 2 ;
    """
    print(f"\nExecuting input script:\n{script}")
    calc.parse(script)
    print(f"\nFinal Variable Environment: {calc.variables}")
