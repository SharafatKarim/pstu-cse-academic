"""
Section 4.1: The Role of the Parser
- Syntactic vs Lexical errors
- Error recovery strategies (Panic mode, Phrase-level)
- Parse tree representation
"""

class Token:
    def __init__(self, type_, value):
        self.type = type_
        self.value = value

    def __repr__(self):
        return f"Token({self.type}, {repr(self.value)})"

class ParseTreeNode:
    def __init__(self, name):
        self.name = name
        self.children = []

    def add_child(self, child):
        self.children.append(child)

    def display(self, indent=0):
        prefix = "  " * indent
        print(f"{prefix}- {self.name}")
        for child in self.children:
            if isinstance(child, ParseTreeNode):
                child.display(indent + 1)
            else:
                print(f"{prefix}    {child}")

    def to_graphviz(self, dot=None, parent_id=None, counter=[0]):
        try:
            from graphviz import Digraph
        except ImportError:
            return None

        if dot is None:
            dot = Digraph("ParseTree", comment="Parse Tree Visualization")
            dot.attr("node", shape="ellipse", fontname="Helvetica", fontsize="10")
            dot.attr("edge", fontname="Helvetica", fontsize="9")

        node_id = f"node_{counter[0]}"
        counter[0] += 1

        dot.node(node_id, str(self.name))
        if parent_id is not None:
            dot.edge(parent_id, node_id)

        for child in self.children:
            if isinstance(child, ParseTreeNode):
                child.to_graphviz(dot, node_id, counter)
            else:
                child_id = f"leaf_{counter[0]}"
                counter[0] += 1
                dot.node(child_id, str(child), shape="box", style="rounded")
                dot.edge(node_id, child_id)

        return dot

"""
Section 4.1: The Role of the Parser - Phrase-Level Error Recovery
Instead of discarding all tokens up to a synchronizing token, phrase-level recovery
performs localized correction on the remaining input:
- Inserting a missing token (e.g. missing '=' in assignment, missing ')')
- Replacing an erroneous token with the expected token
- Deleting an extraneous prefix token
"""

class Token:
    def __init__(self, type_, value):
        self.type = type_
        self.value = value

    def __repr__(self):
        return f"Token({self.type}, {repr(self.value)})"

class ParseTreeNode:
    def __init__(self, name):
        self.name = name
        self.children = []

    def add_child(self, child):
        self.children.append(child)

    def display(self, indent=0):
        prefix = "  " * indent
        print(f"{prefix}- {self.name}")
        for child in self.children:
            if isinstance(child, ParseTreeNode):
                child.display(indent + 1)
            else:
                print(f"{prefix}    {child}")

    def to_graphviz(self, dot=None, parent_id=None, counter=[0]):
        try:
            from graphviz import Digraph
        except ImportError:
            return None

        if dot is None:
            dot = Digraph("ParseTree", comment="Parse Tree - Phrase-Level Recovery")
            dot.attr("node", shape="ellipse", fontname="Helvetica", fontsize="10")
            dot.attr("edge", fontname="Helvetica", fontsize="9")

        node_id = f"node_{counter[0]}"
        counter[0] += 1

        dot.node(node_id, str(self.name))
        if parent_id is not None:
            dot.edge(parent_id, node_id)

        for child in self.children:
            if isinstance(child, ParseTreeNode):
                child.to_graphviz(dot, node_id, counter)
            else:
                child_id = f"leaf_{counter[0]}"
                counter[0] += 1
                dot.node(child_id, str(child), shape="box", style="rounded")
                dot.edge(node_id, child_id)

        return dot

class PhraseLevelParser:
    """
    Demonstrates phrase-level error recovery:
    Performs local corrections on the remaining input by:
    1. Inserting expected tokens (e.g. missing '=', missing ';', missing ')')
    2. Replacing or skipping extraneous tokens so the current statement can still be parsed.
    """
    def __init__(self, tokens):
        self.tokens = list(tokens)
        self.pos = 0

    def current_token(self):
        if self.pos < len(self.tokens):
            return self.tokens[self.pos]
        return Token("EOF", "")

    def peek_token(self, offset=1):
        idx = self.pos + offset
        if idx < len(self.tokens):
            return self.tokens[idx]
        return Token("EOF", "")

    def match(self, expected_type, expected_val=None):
        tok = self.current_token()
        if tok.type == expected_type and (expected_val is None or tok.value == expected_val):
            self.pos += 1
            return tok
        return None

    def recover_insert(self, expected_type, default_val):
        """Phrase-level action: Insert a missing token locally and continue."""
        inserted = Token(expected_type, default_val)
        print(f"  [Phrase-Level Recovery] Missing '{default_val}' detected before '{self.current_token().value}'. Locally inserting '{default_val}'.")
        return inserted

    def parse_factor(self):
        """Factor -> ID | NUM | '(' Expr ')'"""
        tok = self.current_token()
        if tok.type in ("ID", "NUM"):
            self.pos += 1
            return ParseTreeNode(f"{tok.type}({tok.value})")
        elif tok.type == "BRACES" and tok.value == "(":
            self.pos += 1
            node = ParseTreeNode("Factor")
            node.add_child(ParseTreeNode("("))
            expr_node = self.parse_expr()
            if expr_node:
                node.add_child(expr_node)
            if not self.match("BRACES", ")"):
                self.recover_insert("BRACES", ")")
            node.add_child(ParseTreeNode(")"))
            return node
        else:
            # Phrase-level: substitute a default NUM(0) to salvage the expression
            print(f"  [Phrase-Level Recovery] Invalid factor '{tok.value}'. Inserting default '0'.")
            return ParseTreeNode("NUM(0)")

    def parse_expr(self):
        left = self.parse_factor()
        node = ParseTreeNode("Expr")
        node.add_child(left)

        while self.current_token().type in ("OPERATOR", "RELATIONAL_OPERATOR"):
            op_tok = self.current_token()
            self.pos += 1
            node.add_child(ParseTreeNode(f"OP({op_tok.value})"))
            right = self.parse_factor()
            node.add_child(right)

        return node

    def parse_assignment(self):
        tok_id = self.match("ID")
        if not tok_id:
            return None

        tok_eq = self.match("ASSIGN")
        if not tok_eq:
            # Check if current token is a typo/erroneous operator/punctuation (like ',', ':', '==')
            cur = self.current_token()
            if cur.value in (",", ":", "==", "=>"):
                print(f"  [Phrase-Level Recovery] Erroneous token '{cur.value}' in assignment. Replacing '{cur.value}' with '='.")
                tok_eq = Token("ASSIGN", "=")
                self.pos += 1  # consume the erroneous token
            else:
                tok_eq = self.recover_insert("ASSIGN", "=")

        expr_node = self.parse_expr()

        tok_semi = self.match("SEMICOLON")
        if not tok_semi:
            tok_semi = self.recover_insert("SEMICOLON", ";")

        node = ParseTreeNode("AssignmentStmt")
        node.add_child(ParseTreeNode(f"ID({tok_id.value})"))
        node.add_child(ParseTreeNode(f"{tok_eq.value}"))
        node.add_child(expr_node)
        node.add_child(ParseTreeNode(f"{tok_semi.value}"))
        return node

    def parse_declaration(self):
        tok_type = self.match("KEYWORD")
        tok_id = self.match("ID")
        if not tok_id:
            tok_id = self.recover_insert("ID", "temp_var")

        node = ParseTreeNode("DeclarationStmt")
        node.add_child(ParseTreeNode(f"TYPE({tok_type.value})"))
        node.add_child(ParseTreeNode(f"ID({tok_id.value})"))

        if self.match("ASSIGN"):
            node.add_child(ParseTreeNode("="))
            init_expr = self.parse_expr()
            node.add_child(init_expr)

        if not self.match("SEMICOLON"):
            self.recover_insert("SEMICOLON", ";")

        node.add_child(ParseTreeNode(";"))
        return node

    def parse_if_statement(self):
        self.match("KEYWORD", "if")
        if not self.match("BRACES", "("):
            self.recover_insert("BRACES", "(")

        cond_node = self.parse_expr()

        if not self.match("BRACES", ")"):
            self.recover_insert("BRACES", ")")

        then_body = self.parse_statement()

        node = ParseTreeNode("IfStmt")
        node.add_child(ParseTreeNode("if"))
        node.add_child(ParseTreeNode("("))
        node.add_child(cond_node)
        node.add_child(ParseTreeNode(")"))
        if then_body:
            node.add_child(then_body)

        if self.current_token().type == "KEYWORD" and self.current_token().value == "else":
            self.match("KEYWORD", "else")
            node.add_child(ParseTreeNode("else"))
            else_body = self.parse_statement()
            if else_body:
                node.add_child(else_body)

        return node

    def parse_block(self):
        self.match("BRACES", "{")
        node = ParseTreeNode("Block")
        node.add_child(ParseTreeNode("{"))

        while self.pos < len(self.tokens):
            if self.current_token().type == "BRACES" and self.current_token().value == "}":
                break
            stmt = self.parse_statement()
            if stmt:
                node.add_child(stmt)

        if not self.match("BRACES", "}"):
            self.recover_insert("BRACES", "}")

        node.add_child(ParseTreeNode("}"))
        return node

    def parse_statement(self):
        tok = self.current_token()
        types = {"int", "float", "double", "char", "bool", "long", "short", "void", "var", "let", "const"}

        if tok.type == "BRACES" and tok.value == "{":
            return self.parse_block()
        elif tok.type == "KEYWORD" and tok.value in types:
            return self.parse_declaration()
        elif tok.type == "KEYWORD" and tok.value == "if":
            return self.parse_if_statement()
        elif tok.type == "ID":
            return self.parse_assignment()
        elif tok.type == "SEMICOLON":
            self.match("SEMICOLON")
            return ParseTreeNode("EmptyStmt(;)")
        elif tok.type == "EOF":
            return None
        else:
            print(f"  [Phrase-Level Recovery] Skipping unexpected token '{tok.value}'")
            self.pos += 1
            return None

    def parse_program(self):
        root = ParseTreeNode("Program")
        while self.pos < len(self.tokens):
            stmt = self.parse_statement()
            if stmt:
                root.add_child(stmt)
        return root

def simple_tokenizer(code):
    tokens = code.split()
    results = []

    keywords = {
        # Python
        "False", "None", "True", "and", "as", "assert", "async", "await",
        "break", "class", "continue", "def", "del", "elif", "else", "except",
        "finally", "for", "from", "global", "if", "import", "in", "is",
        "lambda", "nonlocal", "not", "or", "pass", "raise", "return", "try",
        "while", "with", "yield",
        # C / C++ / Java / C#
        "auto", "bool", "byte", "case", "catch", "char", "checked", "const",
        "decimal", "default", "delegate", "do", "double", "dynamic", "enum",
        "event", "explicit", "extern", "finally", "fixed", "float",
        "foreach", "goto", "implicit", "int", "interface", "internal", "lock",
        "long", "namespace", "new", "null", "object", "operator", "out",
        "override", "params", "private", "protected", "public", "readonly",
        "ref", "sbyte", "sealed", "short", "sizeof", "stackalloc", "static",
        "string", "struct", "switch", "this", "throw", "typeof", "uint",
        "ulong", "unchecked", "unsafe", "ushort", "using", "virtual", "void",
        "volatile",
        # Additional common language keywords
        "strictfp", "native", "transient", "synchronized", "abstract", "final",
        "extends", "implements", "instanceof", "package", "super",
        "throws", "var", "let",
        # HTML / XML Tags (tag names only, not general identifiers like 'a')
        "div", "span", "img", "input", "button", "textarea", "select", "option",
        "ul", "ol", "li", "table", "tr", "td", "th", "thead", "tbody", "tfoot",
        "style", "script", "link", "meta", "title", "head", "body", "html"
    }

    for lexeme in tokens:
        # Separate trailing semicolons if attached to a word
        has_trailing_semi = False
        raw_lexeme = lexeme
        if len(lexeme) > 1 and lexeme.endswith(";"):
            raw_lexeme = lexeme[:-1]
            has_trailing_semi = True

        if raw_lexeme in keywords:
            token_type = "KEYWORD"
        elif raw_lexeme.startswith("<") and raw_lexeme.endswith(">"):
            token_type = "HTML_TAG"
        elif raw_lexeme == "=":
            token_type = "ASSIGN"
        elif raw_lexeme in ["+", "-", "*", "/", "&", "|", "&&", "||"]:
            token_type = "OPERATOR"
        elif raw_lexeme in ["==", "!=", "<", ">", "<=", ">="]:
            token_type = "RELATIONAL_OPERATOR"
        elif raw_lexeme in ["<<", ">>"]:
            token_type = "SHIFT_OPERATOR"
        elif raw_lexeme.isdigit():
            token_type = "NUM"
        elif raw_lexeme in ["{", "}", "(", ")", "[", "]"]:
            token_type = "BRACES"
        elif raw_lexeme == ";":
            token_type = "SEMICOLON"
        elif raw_lexeme.isidentifier():
            token_type = "ID"
        else:
            token_type = "LEXICAL_ERROR"

        results.append(Token(token_type, raw_lexeme))

        if has_trailing_semi:
            results.append(Token("SEMICOLON", ";"))

    return results


if __name__ == "__main__":
    print("=== Section 4.1: Phrase-Level Error Recovery ===")
    print("Enter source code (or press Enter to use default sample):")
    src = input().strip()

    if not src:
        # Notice missing '=' in first stmt and missing ';' in second
        src = "x 10 ; y = 20"
        print(f"Using default: {src}")

    tokens = simple_tokenizer(src)
    print("\n[Generated Tokens]:")
    for tok in tokens:
        print(f"  {tok}")

    print("\n[Parsing & Phrase-Level Recovery]:")
    parser = PhraseLevelParser(tokens)
    tree = parser.parse_program()

    print("\n[Resulting Parse Tree]:")
    tree.display()

    # 3. Optional Graphviz Tree Image Generation
    try:
        dot = tree.to_graphviz()
        if dot:
            output_path = dot.render("parse_tree_phrase_level", format="png", cleanup=True)
            print(f"\n[Graphviz Image Generated]: Saved parse tree visualization to '{output_path}'")
        else:
            print("\n[Graphviz Notice]: 'graphviz' Python library not installed.")
    except Exception as e:
        print(f"\n[Graphviz Warning]: Could not render image ({e}).")
