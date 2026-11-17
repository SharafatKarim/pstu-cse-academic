"""
Section 4.3: Dangling-Else Resolution
- Takes braceless C-style if-else code as input
- Parses under the standard unambiguous convention (MatchedStmt / OpenStmt)
- Resolves which 'if' each 'else' belongs to (pairing each 'else' with the closest unmatched 'if')
- Generates a clear indented structured explanation and a Graphviz parse tree
"""

class ASTNode:
    def __init__(self, name):
        self.name = name
        self.children = []

    def add(self, child):
        self.children.append(child)

    def display(self, indent=0):
        prefix = "  " * indent
        print(f"{prefix}- {self.name}")
        for c in self.children:
            if isinstance(c, ASTNode):
                c.display(indent + 1)
            else:
                print(f"{prefix}    {c}")

    def to_graphviz(self, dot=None, parent_id=None, counter=[0]):
        try:
            from graphviz import Digraph
        except ImportError:
            return None

        if dot is None:
            dot = Digraph("DanglingElseTree", comment="Dangling Else Parse Tree")
            dot.attr("node", shape="ellipse", fontname="Helvetica", fontsize="10")
            dot.attr("edge", fontname="Helvetica", fontsize="9")

        nid = f"n_{counter[0]}"
        counter[0] += 1
        dot.node(nid, str(self.name))

        if parent_id is not None:
            dot.edge(parent_id, nid)

        for c in self.children:
            if isinstance(c, ASTNode):
                c.to_graphviz(dot, nid, counter)
            else:
                cid = f"leaf_{counter[0]}"
                counter[0] += 1
                dot.node(cid, str(c), shape="box", style="rounded")
                dot.edge(nid, cid)

        return dot


class DanglingElseParser:
    """
    Implements Dragon Book's unambiguous grammar:
      Stmt        -> MatchedStmt | OpenStmt
      MatchedStmt -> if ( expr ) MatchedStmt else MatchedStmt | other
      OpenStmt    -> if ( expr ) Stmt
                   | if ( expr ) MatchedStmt else OpenStmt
    """
    def __init__(self, tokens):
        self.tokens = tokens
        self.pos = 0

    def cur(self):
        return self.tokens[self.pos] if self.pos < len(self.tokens) else "$"

    def match(self, val):
        if self.cur() == val:
            res = self.cur()
            self.pos += 1
            return res
        return None

    def parse_condition(self):
        """Consumes ( cond )"""
        if not self.match("("):
            return "cond"
        cond_toks = []
        depth = 1
        while self.pos < len(self.tokens) and depth > 0:
            t = self.cur()
            self.pos += 1
            if t == "(":
                depth += 1
                cond_toks.append(t)
            elif t == ")":
                depth -= 1
                if depth > 0:
                    cond_toks.append(t)
            else:
                cond_toks.append(t)
        return " ".join(cond_toks)

    def parse_other(self):
        """Reads a base statement until ';' or keyword"""
        toks = []
        while self.pos < len(self.tokens):
            c = self.cur()
            if c in ("if", "else", "$"):
                break
            toks.append(c)
            self.pos += 1
            if c == ";":
                break
        stmt_text = " ".join(toks) if toks else "other;"
        node = ASTNode(f"Stmt({stmt_text})")
        return node

    def parse_matched_stmt(self):
        if self.cur() == "if":
            save_pos = self.pos
            self.match("if")
            cond = self.parse_condition()
            then_branch = self.parse_matched_stmt()
            if then_branch and self.cur() == "else":
                self.match("else")
                else_branch = self.parse_matched_stmt()
                if else_branch:
                    node = ASTNode(f"MatchedIf(if ({cond}))")
                    node.add(then_branch)
                    node.add(ASTNode(f"MatchedElse(paired with 'if ({cond})')"))
                    node.add(else_branch)
                    return node
            # Backtrack if not matched
            self.pos = save_pos
            return None
        elif self.cur() not in ("else", "$"):
            return self.parse_other()
        return None

    def parse_open_stmt(self):
        if self.cur() == "if":
            self.match("if")
            cond = self.parse_condition()

            # Check if this has an else with an OpenStmt
            save_pos = self.pos
            matched_then = self.parse_matched_stmt()
            if matched_then and self.cur() == "else":
                self.match("else")
                open_else = self.parse_open_stmt()
                node = ASTNode(f"IfElseOpen(if ({cond}))")
                node.add(matched_then)
                node.add(ASTNode(f"Else(paired with 'if ({cond})')"))
                node.add(open_else)
                return node
            else:
                # Backtrack and parse as: if ( cond ) Stmt
                self.pos = save_pos
                then_body = self.parse_stmt()
                node = ASTNode(f"IfOpen(if ({cond}) - No Else)")
                node.add(then_body)
                return node
        return None

    def parse_stmt(self):
        # Try MatchedStmt first, then OpenStmt
        save_pos = self.pos
        matched = self.parse_matched_stmt()
        if matched and (self.cur() not in ("else",) or save_pos == 0):
            return matched
        self.pos = save_pos
        open_stmt = self.parse_open_stmt()
        if open_stmt:
            return open_stmt
        return self.parse_other()


def tokenize_c_code(code):
    # Quick tokenizer for C braceless conditionals
    import re
    token_pattern = r"[a-zA-Z_][a-zA-Z0-9_]*|\d+|==|!=|<=|>=|<|>|[();=+\-*/]"
    return re.findall(token_pattern, code)


if __name__ == "__main__":
    print("Example: if ( x > 0 ) if ( y > 0 ) a = 1 ; else a = 2 ;")
    print("-" * 65)

    user_code = input().strip()
    if not user_code:
        user_code = "if ( x > 0 ) if ( y > 0 ) a = 1 ; else a = 2 ;"
        print(f"Using default: {user_code}")

    tokens = tokenize_c_code(user_code)
    print(f"\nTokens: {tokens}")

    parser = DanglingElseParser(tokens)
    ast = parser.parse_stmt()

    print("\n--- Unambiguous Parse Tree ---")
    ast.display()


    # Render diagram
    try:
        dot = ast.to_graphviz()
        if dot:
            path = dot.render("dangling_else_resolved", format="png", cleanup=True)
            print(f"\n[Graphviz Image Generated]: Saved parse tree to '{path}'")
    except Exception as e:
        print(f"[Graphviz Warning]: {e}")
