"""
Section 4.1: The Role of the Parser - Parse Tree Construction & Visualization
Parses C-syntax code snippets into a hierarchical syntax tree and renders
a clean visual diagram using Graphviz.
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

class PanicModeParser:
    """
    Demonstrates panic-mode error recovery.
    When an unexpected token occurs, discard tokens until a synchronizing
    token (like ';') is reached, then resume parsing the next statement.
    """
    def __init__(self, tokens):
        self.tokens = tokens
        self.pos = 0

    def current_token(self):
        if self.pos < len(self.tokens):
            return self.tokens[self.pos]
        return Token("EOF", "")

    def match(self, expected_type, expected_val=None):
        tok = self.current_token()
        if tok.type == expected_type and (expected_val is None or tok.value == expected_val):
            self.pos += 1
            return tok
        return None

    def panic_recovery(self, sync_tokens={"SEMICOLON"}):
        """Skip tokens until a synchronizing token is found."""
        print(f"  [Panic Mode] Error at token '{self.current_token().value}'. Discarding tokens until synchronizing token...")
        while self.pos < len(self.tokens):
            tok = self.tokens[self.pos]
            self.pos += 1
            if tok.type in sync_tokens:
                print(f"  [Panic Mode] Resynchronized after '{tok.value}'. Resuming parsing.")
                break

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
            tok_close = self.match("BRACES", ")")
            if not tok_close:
                print(f"Syntax Error: expected ')', got {self.current_token()}")
                self.panic_recovery()
                return None
            node.add_child(ParseTreeNode(")"))
            return node
        else:
            print(f"Syntax Error: expected factor (identifier, number, or '('), got {self.current_token()}")
            self.panic_recovery()
            return None

    def parse_expr(self):
        """Expr -> Factor ( (OPERATOR | RELATIONAL_OPERATOR) Factor )*"""
        left = self.parse_factor()
        if not left:
            return None

        node = ParseTreeNode("Expr")
        node.add_child(left)

        while self.current_token().type in ("OPERATOR", "RELATIONAL_OPERATOR"):
            op_tok = self.current_token()
            self.pos += 1
            node.add_child(ParseTreeNode(f"OP({op_tok.value})"))
            right = self.parse_factor()
            if not right:
                return None
            node.add_child(right)

        return node

    def parse_assignment(self):
        """AssignmentStmt -> ID '=' Expr ';'"""
        tok_id = self.match("ID")
        if not tok_id:
            return None

        tok_eq = self.match("ASSIGN")
        if not tok_eq:
            print(f"Syntax Error: expected '=', got {self.current_token()}")
            self.panic_recovery()
            return None

        expr_node = self.parse_expr()
        if not expr_node:
            return None

        tok_semi = self.match("SEMICOLON")
        if not tok_semi:
            print(f"Syntax Error: expected ';', got {self.current_token()}")
            self.panic_recovery()
            return None

        node = ParseTreeNode("AssignmentStmt")
        node.add_child(ParseTreeNode(f"ID({tok_id.value})"))
        node.add_child(ParseTreeNode("="))
        node.add_child(expr_node)
        node.add_child(ParseTreeNode(";"))
        return node

    def parse_if_statement(self):
        """IfStmt -> 'if' '(' Expr ')' Stmt ('else' Stmt)?"""
        tok_if = self.match("KEYWORD", "if")
        if not tok_if:
            return None

        tok_open = self.match("BRACES", "(")
        if not tok_open:
            print(f"Syntax Error: expected '(', got {self.current_token()}")
            self.panic_recovery()
            return None

        cond_node = self.parse_expr()
        if not cond_node:
            return None

        tok_close = self.match("BRACES", ")")
        if not tok_close:
            print(f"Syntax Error: expected ')', got {self.current_token()}")
            self.panic_recovery()
            return None

        then_body = self.parse_statement()
        if not then_body:
            return None

        node = ParseTreeNode("IfStmt")
        node.add_child(ParseTreeNode("if"))
        node.add_child(ParseTreeNode("("))
        node.add_child(cond_node)
        node.add_child(ParseTreeNode(")"))
        node.add_child(then_body)

        # Optional 'else' branch
        if self.current_token().type == "KEYWORD" and self.current_token().value == "else":
            self.match("KEYWORD", "else")
            node.add_child(ParseTreeNode("else"))
            else_body = self.parse_statement()
            if else_body:
                node.add_child(else_body)

        return node

    def parse_while_statement(self):
        """WhileStmt -> 'while' '(' Expr ')' Stmt"""
        tok_while = self.match("KEYWORD", "while")
        if not tok_while:
            return None

        if not self.match("BRACES", "("):
            print(f"Syntax Error: expected '(' after 'while', got {self.current_token()}")
            self.panic_recovery()
            return None

        cond_node = self.parse_expr()
        if not cond_node:
            return None

        if not self.match("BRACES", ")"):
            print(f"Syntax Error: expected ')' after while condition, got {self.current_token()}")
            self.panic_recovery()
            return None

        body_node = self.parse_statement()
        if not body_node:
            return None

        node = ParseTreeNode("WhileStmt")
        node.add_child(ParseTreeNode("while"))
        node.add_child(ParseTreeNode("("))
        node.add_child(cond_node)
        node.add_child(ParseTreeNode(")"))
        node.add_child(body_node)
        return node

    def parse_do_while_statement(self):
        """DoWhileStmt -> 'do' Stmt 'while' '(' Expr ')' ';'"""
        tok_do = self.match("KEYWORD", "do")
        if not tok_do:
            return None

        body_node = self.parse_statement()
        if not body_node:
            return None

        if not (self.current_token().type == "KEYWORD" and self.current_token().value == "while"):
            print(f"Syntax Error: expected 'while' after do-body, got {self.current_token()}")
            self.panic_recovery()
            return None
        self.match("KEYWORD", "while")

        if not self.match("BRACES", "("):
            print(f"Syntax Error: expected '(' after do-while, got {self.current_token()}")
            self.panic_recovery()
            return None

        cond_node = self.parse_expr()
        if not cond_node:
            return None

        if not self.match("BRACES", ")"):
            print(f"Syntax Error: expected ')' after do-while condition, got {self.current_token()}")
            self.panic_recovery()
            return None

        if not self.match("SEMICOLON"):
            print(f"Syntax Error: expected ';' after do-while, got {self.current_token()}")
            self.panic_recovery()
            return None

        node = ParseTreeNode("DoWhileStmt")
        node.add_child(ParseTreeNode("do"))
        node.add_child(body_node)
        node.add_child(ParseTreeNode("while"))
        node.add_child(ParseTreeNode("("))
        node.add_child(cond_node)
        node.add_child(ParseTreeNode(")"))
        node.add_child(ParseTreeNode(";"))
        return node

    def parse_for_statement(self):
        """ForStmt -> 'for' '(' (Declaration | Assignment | ';') Expr? ';' Expr? ')' Stmt"""
        tok_for = self.match("KEYWORD", "for")
        if not tok_for:
            return None

        if not self.match("BRACES", "("):
            print(f"Syntax Error: expected '(' after 'for', got {self.current_token()}")
            self.panic_recovery()
            return None

        node = ParseTreeNode("ForStmt")
        node.add_child(ParseTreeNode("for"))
        node.add_child(ParseTreeNode("("))

        # 1. Init clause: declaration, assignment, or empty ';'
        types = {"int", "float", "double", "char", "bool", "long", "short", "void", "var", "let", "const"}
        if self.current_token().type == "KEYWORD" and self.current_token().value in types:
            init_node = self.parse_declaration()
            if init_node: node.add_child(init_node)
        elif self.current_token().type == "ID":
            init_node = self.parse_assignment()
            if init_node: node.add_child(init_node)
        elif self.match("SEMICOLON"):
            node.add_child(ParseTreeNode(";"))
        else:
            print(f"Syntax Error: invalid init in for-loop: {self.current_token()}")
            self.panic_recovery()

        # 2. Condition clause
        if not (self.current_token().type == "SEMICOLON"):
            cond_node = self.parse_expr()
            if cond_node: node.add_child(cond_node)
        if not self.match("SEMICOLON"):
            print(f"Syntax Error: expected ';' after for-condition, got {self.current_token()}")
            self.panic_recovery()
        else:
            node.add_child(ParseTreeNode(";"))

        # 3. Step/Update clause (e.g. i = i + 1)
        if not (self.current_token().type == "BRACES" and self.current_token().value == ")"):
            if self.current_token().type == "ID":
                tok_id = self.match("ID")
                if self.match("ASSIGN"):
                    upd_node = ParseTreeNode("Step")
                    upd_node.add_child(ParseTreeNode(f"ID({tok_id.value})"))
                    upd_node.add_child(ParseTreeNode("="))
                    expr_node = self.parse_expr()
                    if expr_node: upd_node.add_child(expr_node)
                    node.add_child(upd_node)
                else:
                    step_expr = self.parse_expr()
                    if step_expr: node.add_child(step_expr)
            else:
                step_expr = self.parse_expr()
                if step_expr: node.add_child(step_expr)

        if not self.match("BRACES", ")"):
            print(f"Syntax Error: expected ')' after for header, got {self.current_token()}")
            self.panic_recovery()
            return None
        node.add_child(ParseTreeNode(")"))

        body_node = self.parse_statement()
        if body_node:
            node.add_child(body_node)
        return node

    def parse_return_statement(self):
        """ReturnStmt -> 'return' Expr? ';'"""
        tok_ret = self.match("KEYWORD", "return")
        if not tok_ret:
            return None

        node = ParseTreeNode("ReturnStmt")
        node.add_child(ParseTreeNode("return"))

        if not (self.current_token().type == "SEMICOLON"):
            expr_node = self.parse_expr()
            if expr_node:
                node.add_child(expr_node)

        if not self.match("SEMICOLON"):
            print(f"Syntax Error: expected ';' after return, got {self.current_token()}")
            self.panic_recovery()
            return None

        node.add_child(ParseTreeNode(";"))
        return node

    def parse_declaration(self):
        """DeclarationStmt -> TYPE ID ('=' Expr)? ';'"""
        tok_type = self.match("KEYWORD")
        if not tok_type:
            return None

        tok_id = self.match("ID")
        if not tok_id:
            print(f"Syntax Error: expected identifier after type '{tok_type.value}', got {self.current_token()}")
            self.panic_recovery()
            return None

        node = ParseTreeNode("DeclarationStmt")
        node.add_child(ParseTreeNode(f"TYPE({tok_type.value})"))
        node.add_child(ParseTreeNode(f"ID({tok_id.value})"))

        # Optional initialization: = Expr
        if self.match("ASSIGN"):
            node.add_child(ParseTreeNode("="))
            init_expr = self.parse_expr()
            if not init_expr:
                return None
            node.add_child(init_expr)

        tok_semi = self.match("SEMICOLON")
        if not tok_semi:
            print(f"Syntax Error: expected ';' at end of declaration, got {self.current_token()}")
            self.panic_recovery()
            return None

        node.add_child(ParseTreeNode(";"))
        return node

    def parse_block(self):
        """Block -> '{' Stmt* '}'"""
        tok_open = self.match("BRACES", "{")
        if not tok_open:
            return None

        node = ParseTreeNode("Block")
        node.add_child(ParseTreeNode("{"))

        while self.pos < len(self.tokens):
            if self.current_token().type == "BRACES" and self.current_token().value == "}":
                break
            stmt = self.parse_statement()
            if stmt:
                node.add_child(stmt)

        tok_close = self.match("BRACES", "}")
        if not tok_close:
            print(f"Syntax Error: expected '}}' at end of block, got {self.current_token()}")
            self.panic_recovery({"SEMICOLON", "BRACES"})
            return None

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
        elif tok.type == "KEYWORD" and tok.value == "while":
            return self.parse_while_statement()
        elif tok.type == "KEYWORD" and tok.value == "do":
            return self.parse_do_while_statement()
        elif tok.type == "KEYWORD" and tok.value == "for":
            return self.parse_for_statement()
        elif tok.type == "KEYWORD" and tok.value == "return":
            return self.parse_return_statement()
        elif tok.type == "ID":
            return self.parse_assignment()
        elif tok.type == "SEMICOLON":
            self.match("SEMICOLON")
            return ParseTreeNode("EmptyStmt(;)")
        else:
            print(f"Syntax Error: unexpected statement beginning with {tok}")
            self.panic_recovery()
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
    print("=== Section 4.1: Parse Tree Construction & Visualization ===")
    print("Enter C-like source code (or press Enter to use default sample):")
    src = input().strip()

    if not src:
        src = "int a = 10 ; if ( a > 5 ) { y = a * 2 ; } else { y = 0 ; }"
        print(f"Using default: {src}")

    # 1. Lexical Phase: Token Generation
    tokens = simple_tokenizer(src)
    print("\n[Generated Tokens]:")
    for tok in tokens:
        print(f"  {tok}")

    # Check for lexical errors
    lex_errors = [tok for tok in tokens if tok.type == "LEXICAL_ERROR"]
    if lex_errors:
        print(f"\n[Lexical Errors Found]: {len(lex_errors)}")
        for err in lex_errors:
            print(f"  Invalid lexeme: '{err.value}'")

    # 2. Syntax Analysis Phase: Parsing & Error Recovery
    print("\n[Parsing & Syntax Error Recovery]:")
    parser = PanicModeParser(tokens)
    tree = parser.parse_program()

    print("\n[Resulting Parse Tree]:")
    tree.display()

    # 3. Optional Graphviz Tree Image Generation
    try:
        dot = tree.to_graphviz()
        if dot:
            output_path = dot.render("parse_tree_full", format="png", cleanup=True)
            print(f"\n[Graphviz Image Generated]: Saved parse tree visualization to '{output_path}'")
        else:
            print("\n[Graphviz Notice]: 'graphviz' Python library not installed. Run 'pip install graphviz' to generate tree images.")
    except Exception as e:
        print(f"\n[Graphviz Warning]: Could not render image ({e}). Ensure Graphviz system package is installed ('sudo pacman -S graphviz' or 'sudo apt install graphviz').")
