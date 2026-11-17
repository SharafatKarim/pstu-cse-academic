"""
Section 4.8: Using Ambiguous Grammars (Dragon Book)
- Resolving shift/reduce conflicts in expression grammars by specifying operator precedence levels (e.g., + vs *).
- Resolving the dangling-else ambiguity directly in LR parsing tables by preferring shift over reduce.

Features:
1. Lexer supporting C-like syntax:
   - Statements: if, else, while, return, expression statements, block statements {...}
   - Operators with full C precedence levels:
     * assignment (=, +=, -=, etc.) [right-associative]
     * logical or (||), logical and (&&)
     * equality (==, !=), relational (<, <=, >, >=)
     * additive (+, -), multiplicative (*, /, %)
     * unary (!, -, ~) [right-associative]
   - Parentheses (), braces {}, semicolons ;, identifiers, numbers/literals.
2. LR parser generator for ambiguous C grammars:
   - Constructs LR(0) items and canonical collection.
   - Detects all Shift/Reduce conflicts in the ambiguous grammar.
   - Resolves Expression Shift/Reduce conflicts using operator precedence and associativity.
   - Resolves Dangling-Else Shift/Reduce conflicts by preferring SHIFT ('else') over REDUCE (unmatched 'if').
3. Interactive user input loop:
   - Input any C-like code snippet or choose from standard presets.
   - Traces the conflict resolution step-by-step and parsing stack trace.
   - Optional parse tree visualization (Graphviz / ASCII tree).
"""

import sys
import re

# ==============================================================================
# 1. LEXICAL ANALYZER (TOKENIZER) FOR C-LIKE SYNTAX
# ==============================================================================

TOKEN_SPEC = [
    ("COMMENT_MULTI", r"/\*[\s\S]*?\*/"),
    ("COMMENT_SINGLE", r"//.*"),
    ("IF", r"\bif\b"),
    ("ELSE", r"\belse\b"),
    ("WHILE", r"\bwhile\b"),
    ("RETURN", r"\breturn\b"),
    ("EQ", r"=="),
    ("NE", r"!="),
    ("LE", r"<="),
    ("GE", r">="),
    ("AND", r"&&"),
    ("OR", r"\|\|"),
    ("ASSIGN_ADD", r"\+="),
    ("ASSIGN_SUB", r"-="),
    ("ASSIGN", r"="),
    ("LT", r"<"),
    ("GT", r">"),
    ("PLUS", r"\+"),
    ("MINUS", r"-"),
    ("STAR", r"\*"),
    ("SLASH", r"/"),
    ("PERCENT", r"%"),
    ("NOT", r"!"),
    ("LPAREN", r"\("),
    ("RPAREN", r"\)"),
    ("LBRACE", r"\{"),
    ("RBRACE", r"\}"),
    ("SEMI", r";"),
    ("NUMBER", r"\b\d+(\.\d+)?\b"),
    ("ID", r"\b[a-zA-Z_][a-zA-Z0-9_]*\b"),
    ("WS", r"\s+"),
]

TOKEN_REGEX = "|".join(f"(?P<{name}>{pattern})" for name, pattern in TOKEN_SPEC)
TOKEN_RE = re.compile(TOKEN_REGEX)

def tokenize(code):
    tokens = []
    for match in TOKEN_RE.finditer(code):
        kind = match.lastgroup
        value = match.group()
        if kind in ("WS", "COMMENT_SINGLE", "COMMENT_MULTI"):
            continue
        tokens.append((kind, value))
    return tokens

# Map token types to grammar terminal symbols
TOKEN_TO_TERMINAL = {
    "IF": "if",
    "ELSE": "else",
    "WHILE": "while",
    "RETURN": "return",
    "EQ": "==",
    "NE": "!=",
    "LE": "<=",
    "GE": ">=",
    "LT": "<",
    "GT": ">",
    "AND": "&&",
    "OR": "||",
    "ASSIGN": "=",
    "ASSIGN_ADD": "+=",
    "ASSIGN_SUB": "-=",
    "PLUS": "+",
    "MINUS": "-",
    "STAR": "*",
    "SLASH": "/",
    "PERCENT": "%",
    "NOT": "!",
    "LPAREN": "(",
    "RPAREN": ")",
    "LBRACE": "{",
    "RBRACE": "}",
    "SEMI": ";",
    "NUMBER": "num",
    "ID": "id",
}

# ==============================================================================
# 2. OPERATOR PRECEDENCE & ASSOCIATIVITY SPECIFICATION
# ==============================================================================

# Higher number means higher precedence (following C standards)
PRECEDENCE_TABLE = {
    "=": (1, "right"),
    "+=": (1, "right"),
    "-=": (1, "right"),
    "||": (2, "left"),
    "&&": (3, "left"),
    "==": (4, "left"),
    "!=": (4, "left"),
    "<": (5, "left"),
    "<=": (5, "left"),
    ">": (5, "left"),
    ">=": (5, "left"),
    "+": (6, "left"),
    "-": (6, "left"),
    "*": (7, "left"),
    "/": (7, "left"),
    "%": (7, "left"),
    "unary_minus": (8, "right"),
    "!": (8, "right"),
}

# Ambiguous grammar productions:
# Note: Ambiguity exists both in expressions (E -> E op E) and in conditionals (S -> if ( E ) S | if ( E ) S else S)
C_AMBIGUOUS_GRAMMAR = [
    # 0: Augmented start rule
    ("S'", ["Program"]),
    
    # Program & Statement List
    ("Program", ["StmtList"]),
    ("StmtList", ["StmtList", "Stmt"]),
    ("StmtList", ["Stmt"]),
    
    # Statements (Ambiguous Dangling-Else grammar)
    ("Stmt", ["if", "(", "Expr", ")", "Stmt"]),
    ("Stmt", ["if", "(", "Expr", ")", "Stmt", "else", "Stmt"]),
    ("Stmt", ["while", "(", "Expr", ")", "Stmt"]),
    ("Stmt", ["{", "StmtList", "}"]),
    ("Stmt", ["{", "}"]),
    ("Stmt", ["return", "Expr", ";"]),
    ("Stmt", ["return", ";"]),
    ("Stmt", ["Expr", ";"]),
    ("Stmt", [";"]),
    
    # Ambiguous Expression Grammar: E -> E op E
    ("Expr", ["Expr", "=", "Expr"]),
    ("Expr", ["Expr", "+=", "Expr"]),
    ("Expr", ["Expr", "-=", "Expr"]),
    ("Expr", ["Expr", "||", "Expr"]),
    ("Expr", ["Expr", "&&", "Expr"]),
    ("Expr", ["Expr", "==", "Expr"]),
    ("Expr", ["Expr", "!=", "Expr"]),
    ("Expr", ["Expr", "<", "Expr"]),
    ("Expr", ["Expr", "<=", "Expr"]),
    ("Expr", ["Expr", ">", "Expr"]),
    ("Expr", ["Expr", ">=", "Expr"]),
    ("Expr", ["Expr", "+", "Expr"]),
    ("Expr", ["Expr", "-", "Expr"]),
    ("Expr", ["Expr", "*", "Expr"]),
    ("Expr", ["Expr", "/", "Expr"]),
    ("Expr", ["Expr", "%", "Expr"]),
    ("Expr", ["!", "Expr"]),
    ("Expr", ["-", "Expr"]),  # unary minus
    ("Expr", ["(", "Expr", ")"]),
    ("Expr", ["id"]),
    ("Expr", ["num"]),
]

NON_TERMINALS = {"S'", "Program", "StmtList", "Stmt", "Expr"}

# Associate productions with operator symbols for precedence resolution
PROD_OPERATORS = {
    ("Expr", ("Expr", "=", "Expr")): "=",
    ("Expr", ("Expr", "+=", "Expr")): "+=",
    ("Expr", ("Expr", "-=", "Expr")): "-=",
    ("Expr", ("Expr", "||", "Expr")): "||",
    ("Expr", ("Expr", "&&", "Expr")): "&&",
    ("Expr", ("Expr", "==", "Expr")): "==",
    ("Expr", ("Expr", "!=", "Expr")): "!=",
    ("Expr", ("Expr", "<", "Expr")): "<",
    ("Expr", ("Expr", "<=", "Expr")): "<=",
    ("Expr", ("Expr", ">", "Expr")): ">",
    ("Expr", ("Expr", ">=", "Expr")): ">=",
    ("Expr", ("Expr", "+", "Expr")): "+",
    ("Expr", ("Expr", "-", "Expr")): "-",
    ("Expr", ("Expr", "*", "Expr")): "*",
    ("Expr", ("Expr", "/", "Expr")): "/",
    ("Expr", ("Expr", "%", "Expr")): "%",
    ("Expr", ("!", "Expr")): "!",
    ("Expr", ("-", "Expr")): "unary_minus",
}

# ==============================================================================
# 3. LR(0) ITEM SETS & SLR TABLE GENERATOR WITH CONFLICT RESOLUTION
# ==============================================================================

class LR0Item:
    def __init__(self, prod_idx, lhs, rhs, dot_pos):
        self.prod_idx = prod_idx
        self.lhs = lhs
        self.rhs = tuple(rhs)
        self.dot_pos = dot_pos

    def next_symbol(self):
        if self.dot_pos < len(self.rhs):
            return self.rhs[self.dot_pos]
        return None

    def advance(self):
        return LR0Item(self.prod_idx, self.lhs, self.rhs, self.dot_pos + 1)

    def is_reduce(self):
        return self.dot_pos == len(self.rhs)

    def __eq__(self, other):
        return (self.prod_idx, self.lhs, self.rhs, self.dot_pos) == (other.prod_idx, other.lhs, other.rhs, other.dot_pos)

    def __hash__(self):
        return hash((self.prod_idx, self.lhs, self.rhs, self.dot_pos))

    def __repr__(self):
        before = " ".join(self.rhs[:self.dot_pos])
        after = " ".join(self.rhs[self.dot_pos:])
        rhs_str = f"{before} · {after}".strip()
        return f"{self.lhs} -> {rhs_str}"

def compute_first_and_follow(rules, non_terminals):
    terminals = set()
    for lhs, rhs in rules:
        for s in rhs:
            if s not in non_terminals:
                terminals.add(s)
    terminals.add("$")

    first = {nt: set() for nt in non_terminals}
    for t in terminals:
        first[t] = {t}

    changed = True
    while changed:
        changed = False
        for lhs, rhs in rules:
            if not rhs:
                if "" not in first[lhs]:
                    first[lhs].add("")
                    changed = True
                continue
            for s in rhs:
                s_first = first[s] - {""}
                if not s_first.issubset(first[lhs]):
                    first[lhs].update(s_first)
                    changed = True
                if "" not in first[s]:
                    break
            else:
                if "" not in first[lhs]:
                    first[lhs].add("")
                    changed = True

    follow = {nt: set() for nt in non_terminals}
    follow["S'"].add("$")

    changed = True
    while changed:
        changed = False
        for lhs, rhs in rules:
            trailer = follow[lhs].copy()
            for s in reversed(rhs):
                if s in non_terminals:
                    if not trailer.issubset(follow[s]):
                        follow[s].update(trailer)
                        changed = True
                    if "" in first[s]:
                        trailer = trailer | (first[s] - {""})
                    else:
                        trailer = first[s]
                else:
                    trailer = first[s]
    return first, follow

def lr0_closure(items, grammar_by_lhs):
    closure = set(items)
    changed = True
    while changed:
        changed = False
        new_items = set()
        for item in closure:
            B = item.next_symbol()
            if B in grammar_by_lhs:
                for prod_idx, (lhs, rhs) in grammar_by_lhs[B]:
                    new_item = LR0Item(prod_idx, lhs, rhs, 0)
                    if new_item not in closure:
                        new_items.add(new_item)
        if new_items:
            closure.update(new_items)
            changed = True
    return frozenset(closure)

def lr0_goto(items, symbol, grammar_by_lhs):
    moved = set()
    for item in items:
        if item.next_symbol() == symbol:
            moved.add(item.advance())
    if not moved:
        return frozenset()
    return lr0_closure(moved, grammar_by_lhs)

class AmbiguousLRParser:
    def __init__(self, rules, non_terminals):
        self.rules = rules
        self.non_terminals = non_terminals
        self.grammar_by_lhs = {}
        for idx, (lhs, rhs) in enumerate(rules):
            self.grammar_by_lhs.setdefault(lhs, []).append((idx, (lhs, rhs)))

        self.first, self.follow = compute_first_and_follow(rules, non_terminals)
        self.states = []
        self.action_table = {}
        self.goto_table = {}
        self.resolved_conflicts = []
        self._build_tables()

    def _build_tables(self):
        start_item = LR0Item(0, self.rules[0][0], self.rules[0][1], 0)
        start_state = lr0_closure({start_item}, self.grammar_by_lhs)

        self.states = [start_state]
        state_map = {start_state: 0}

        i = 0
        while i < len(self.states):
            curr_state = self.states[i]
            # Find symbols after dot
            symbols = set()
            for item in curr_state:
                sym = item.next_symbol()
                if sym is not None:
                    symbols.add(sym)

            for sym in symbols:
                next_state = lr0_goto(curr_state, sym, self.grammar_by_lhs)
                if not next_state:
                    continue
                if next_state not in state_map:
                    state_map[next_state] = len(self.states)
                    self.states.append(next_state)
                next_idx = state_map[next_state]

                if sym in self.non_terminals:
                    self.goto_table[(i, sym)] = next_idx
                else:
                    self._record_action(i, sym, ("SHIFT", next_idx))

            # Reductions
            for item in curr_state:
                if item.is_reduce():
                    if item.prod_idx == 0:
                        self._record_action(i, "$", ("ACCEPT", 0))
                    else:
                        for la in self.follow[item.lhs]:
                            self._record_action(i, la, ("REDUCE", item.prod_idx))
            i += 1

    def _resolve_shift_reduce_conflict(self, state_idx, lookahead, shift_target, reduce_prod_idx):
        """
        Dragon Book Section 4.8 Ambiguity Resolution Rules:
        1. Dangling-Else:
           If reduce rule is 'Stmt -> if ( Expr ) Stmt' and lookahead is 'else',
           resolve in favor of SHIFT ('else').
           This pairs 'else' with the nearest unmatched 'if'.
        2. Operator Precedence and Associativity:
           If reduce rule has operator op_stack (from E -> E op_stack E) and lookahead is op_lookahead:
           - If prec(op_lookahead) > prec(op_stack): SHIFT
           - If prec(op_lookahead) < prec(op_stack): REDUCE
           - If prec(op_lookahead) == prec(op_stack):
               * Left-associative: REDUCE
               * Right-associative: SHIFT
        """
        lhs, rhs = self.rules[reduce_prod_idx]
        key = (lhs, tuple(rhs))

        # Check Dangling-Else conflict
        if lhs == "Stmt" and rhs == ["if", "(", "Expr", ")", "Stmt"] and lookahead == "else":
            reason = (
                f"[Dangling-Else Resolution] In State {state_idx}:\n"
                f"    Conflict between SHIFT 'else' (to state {shift_target}) vs REDUCE by Stmt -> if ( Expr ) Stmt.\n"
                f"    Resolution: Prefer SHIFT over REDUCE (pairs 'else' with innermost 'if')."
            )
            self.resolved_conflicts.append(reason)
            return ("SHIFT", shift_target)

        # Check Operator Precedence conflict
        if key in PROD_OPERATORS and lookahead in PRECEDENCE_TABLE:
            op_stack = PROD_OPERATORS[key]
            op_lookahead = lookahead

            prec_stack, assoc_stack = PRECEDENCE_TABLE[op_stack]
            prec_next, _ = PRECEDENCE_TABLE[op_lookahead]

            if prec_next > prec_stack:
                action = ("SHIFT", shift_target)
                desc = f"Precedence of lookahead '{op_lookahead}' ({prec_next}) > stack operator '{op_stack}' ({prec_stack}) -> SHIFT"
            elif prec_next < prec_stack:
                action = ("REDUCE", reduce_prod_idx)
                desc = f"Precedence of stack operator '{op_stack}' ({prec_stack}) > lookahead '{op_lookahead}' ({prec_next}) -> REDUCE"
            else:
                # Equal precedence: check associativity
                if assoc_stack == "left":
                    action = ("REDUCE", reduce_prod_idx)
                    desc = f"Equal precedence for '{op_stack}' and '{op_lookahead}', left-associative -> REDUCE"
                else:
                    action = ("SHIFT", shift_target)
                    desc = f"Equal precedence for '{op_stack}' and '{op_lookahead}', right-associative -> SHIFT"

            reason = (
                f"[Expression Precedence Resolution] In State {state_idx} on lookahead '{lookahead}':\n"
                f"    Reduce production: {lhs} -> {' '.join(rhs)}\n"
                f"    Decision: {desc} -> {action[0]}"
            )
            self.resolved_conflicts.append(reason)
            return action

        # Default fallback if unspecified: prefer SHIFT
        fallback_reason = (
            f"[Default Conflict Resolution] In State {state_idx} on '{lookahead}':\n"
            f"    Shift to {shift_target} vs Reduce {lhs} -> {' '.join(rhs)}. Chose SHIFT."
        )
        self.resolved_conflicts.append(fallback_reason)
        return ("SHIFT", shift_target)

    def _record_action(self, state_idx, sym, action):
        key = (state_idx, sym)
        if key not in self.action_table:
            self.action_table[key] = action
            return

        existing = self.action_table[key]
        if existing == action:
            return

        # Conflict detected
        act1, act2 = existing, action
        # Distinguish Shift/Reduce
        shift_act = act1 if act1[0] == "SHIFT" else (act2 if act2[0] == "SHIFT" else None)
        reduce_act = act1 if act1[0] == "REDUCE" else (act2 if act2[0] == "REDUCE" else None)

        if shift_act and reduce_act:
            resolved = self._resolve_shift_reduce_conflict(state_idx, sym, shift_act[1], reduce_act[1])
            self.action_table[key] = resolved
        else:
            # Reduce/Reduce conflict fallback: pick earlier rule
            if act1[0] == "REDUCE" and act2[0] == "REDUCE":
                chosen = min(act1[1], act2[1])
                self.action_table[key] = ("REDUCE", chosen)

    def parse(self, token_pairs, verbose=True):
        """
        Simulates LR parsing step-by-step with state stack and symbol stack.
        Builds a parse tree node for AST/visualization.
        """
        state_stack = [0]
        node_stack = []
        token_input = list(token_pairs) + [("$", "$")]
        ip = 0

        trace_log = []
        rule_history = []

        if verbose:
            header = f"{'State Stack':<28} {'Symbol Stack':<28} {'Lookahead':<14} {'Action'}"
            print("\n" + "=" * 90)
            print("STEP-BY-STEP LR PARSE TRACE (WITH PRECEDENCE & DANGLING-ELSE RESOLUTION)")
            print("=" * 90)
            print(header)
            print("-" * 90)

        step = 0
        while True:
            step += 1
            curr_state = state_stack[-1]
            token_type, token_val = token_input[ip]
            terminal = TOKEN_TO_TERMINAL.get(token_type, token_val)
            action = self.action_table.get((curr_state, terminal))

            state_str = " ".join(str(s) for s in state_stack)
            if len(state_str) > 26:
                state_str = "..." + state_str[-23:]

            sym_str = " ".join(n["label"] for n in node_stack) if node_stack else "$"
            if len(sym_str) > 26:
                sym_str = "..." + sym_str[-23:]

            la_str = f"'{token_val}' ({terminal})"
            if len(la_str) > 13:
                la_str = la_str[:11] + ".."

            if not action:
                err_msg = f"Syntax Error: No action defined for State {curr_state} on terminal '{terminal}'"
                if verbose:
                    print(f"{state_str:<28} {sym_str:<28} {la_str:<14} {err_msg}")
                return False, None, trace_log

            act_type, target = action

            if act_type == "SHIFT":
                act_str = f"Shift '{token_val}' -> State {target}"
                if verbose:
                    print(f"{state_str:<28} {sym_str:<28} {la_str:<14} {act_str}")
                trace_log.append((state_str, sym_str, token_val, act_str))

                node = {"label": terminal, "value": token_val, "children": []}
                node_stack.append(node)
                state_stack.append(target)
                ip += 1

            elif act_type == "REDUCE":
                lhs, rhs = self.rules[target]
                k = len(rhs)
                act_str = f"Reduce: {lhs} -> {' '.join(rhs)}"
                if verbose:
                    print(f"{state_str:<28} {sym_str:<28} {la_str:<14} {act_str}")
                trace_log.append((state_str, sym_str, token_val, act_str))
                rule_history.append((lhs, rhs))

                # Pop k symbols and states
                children = []
                for _ in range(k):
                    state_stack.pop()
                    children.insert(0, node_stack.pop())

                parent_node = {"label": lhs, "value": lhs, "children": children}
                node_stack.append(parent_node)

                # Goto
                top_state = state_stack[-1]
                goto_state = self.goto_table.get((top_state, lhs))
                if goto_state is None:
                    err_msg = f"Internal Error: Missing GOTO for State {top_state} on nonterminal {lhs}"
                    if verbose:
                        print(f"{'':<70} {err_msg}")
                    return False, None, trace_log
                state_stack.append(goto_state)

            elif act_type == "ACCEPT":
                act_str = "Accept (Parse Successful)"
                if verbose:
                    print(f"{state_str:<28} {sym_str:<28} {la_str:<14} {act_str}")
                    print("-" * 90)
                trace_log.append((state_str, sym_str, token_val, act_str))
                root_node = node_stack[0] if node_stack else None
                return True, root_node, trace_log


# ==============================================================================
# 4. PARSE TREE VISUALIZATION (ASCII & GRAPHVIZ)
# ==============================================================================

def print_ascii_tree(node, prefix="", is_last=True):
    if node is None:
        return
    connector = "└── " if is_last else "├── "
    val_disp = f" (val: '{node['value']}')" if node.get("value") and node["value"] != node["label"] else ""
    print(prefix + connector + str(node["label"]) + val_disp)

    children = node.get("children", [])
    new_prefix = prefix + ("    " if is_last else "│   ")
    for i, child in enumerate(children):
        print_ascii_tree(child, new_prefix, i == len(children) - 1)

def export_graphviz(node, filename="parse_tree_ambiguous"):
    try:
        from graphviz import Digraph
    except ImportError:
        return None

    dot = Digraph("ParseTree", comment="LR Ambiguous Grammar Parse Tree")
    dot.attr("node", shape="ellipse", fontname="Courier", fontsize="10")
    dot.attr("edge", fontname="Courier", fontsize="8")

    counter = [0]

    def add_nodes(curr, parent_id=None):
        nid = f"node_{counter[0]}"
        counter[0] += 1
        label = str(curr["label"])
        if curr.get("value") and curr["value"] != curr["label"]:
            label += f"\n('{curr['value']}')"

        is_leaf = len(curr.get("children", [])) == 0
        if is_leaf:
            dot.node(nid, label, shape="box", style="rounded,filled", fillcolor="#e8f4f8")
        else:
            dot.node(nid, label, shape="ellipse", style="filled", fillcolor="#fff2cc")

        if parent_id is not None:
            dot.edge(parent_id, nid)

        for child in curr.get("children", []):
            add_nodes(child, nid)

    add_nodes(node)
    try:
        dot.render(filename, format="png", cleanup=True)
        return f"{filename}.png"
    except Exception as e:
        return None


# ==============================================================================
# 5. USER INTERFACE & DEMONSTRATION
# ==============================================================================

PRESETS = {
    "1": (
        "Arithmetic Precedence & Associativity: a + b * c - d / e",
        "a + b * c - d / e;"
    ),
    "2": (
        "Complex Expressions: x = a + b * c == d || !flag",
        "x = a + b * c == d || !flag;"
    ),
    "3": (
        "Classic Dangling-Else Ambiguity: if (cond1) if (cond2) s1; else s2;",
        "if (cond1) if (cond2) s1; else s2;"
    ),
    "4": (
        "Deeply Nested Dangling-Else: if (a) if (b) if (c) x = 1; else x = 2; else x = 3;",
        "if (a) if (b) if (c) x = 1; else x = 2; else x = 3;"
    ),
    "5": (
        "Combined C statements & arithmetic with while loop",
        "while (i < 10) if (flag) total += i * 2; else total = total + 1;"
    ),
}

def analyze_c_input(parser, code_str):
    print("\n" + "=" * 90)
    print(f"INPUT C CODE:\n  {code_str.strip()}")
    print("=" * 90)

    tokens = tokenize(code_str)
    print(f"Tokens identified ({len(tokens)}):")
    tok_repr = " ".join(f"{t[1]}" for t in tokens)
    print(f"  {tok_repr}")

    # Inspect conflicts relevant to this input
    print("\n--- Ambiguity Resolutions Enforced by LR Table ---")
    relevant_resolutions = []
    # Print sample resolutions from the table
    if any(t[0] in ("PLUS", "MINUS", "STAR", "SLASH", "EQ", "ASSIGN", "OR") for t in tokens):
        print("• Operator Precedence & Associativity:")
        print("    * Multiplication/Division (*, /, %) higher than Addition/Subtraction (+, -).")
        print("    * Relational & Equality (==, <, ...) higher than Logical (&&, ||).")
        print("    * Assignment (=, +=) lowest precedence and right-associative.")
        print("    * When stack has 'E + E ·' and lookahead is '*', SHIFT '*' to evaluate '*' first.")
        print("    * When stack has 'E * E ·' and lookahead is '+', REDUCE 'E * E' first.")
    if any(t[0] == "ELSE" for t in tokens):
        print("• Dangling-Else Ambiguity:")
        print("    * When stack has 'Stmt -> if ( Expr ) Stmt ·' and lookahead is 'else':")
        print("      SHIFT 'else' rather than reducing, binding 'else' with the nearest unmatched 'if'.")

    # Run parse
    success, tree, trace = parser.parse(tokens, verbose=True)

    if success:
        print("\nParse Status: SUCCESSFUL! Syntactically valid according to ambiguous C grammar.")
        print("\n--- Parse Tree (ASCII) ---")
        print_ascii_tree(tree)

        img_path = export_graphviz(tree, "parse_tree_ambiguous")
        if img_path:
            print(f"\n[Saved Graphviz parse tree visualization to: {img_path}]")
    else:
        print("\nParse Status: FAILED (Syntax Error encountered).")


def main():
    print("================================================================================")
    print("   Dragon Book Section 4.8: Ambiguous Grammars, Precedence & Dangling-Else      ")
    print("================================================================================")
    print("Initializing LR parser and resolving table conflicts...")
    
    parser = AmbiguousLRParser(C_AMBIGUOUS_GRAMMAR, NON_TERMINALS)
    print(f"LR(0) States Generated: {len(parser.states)}")
    print(f"Shift/Reduce Conflicts Successfully Resolved: {len(parser.resolved_conflicts)}")

    # Show a few sample resolved conflicts
    print("\nSample Shift/Reduce Conflict Resolutions in Table:")
    for conf in parser.resolved_conflicts[:4]:
        for line in conf.split("\n"):
            print(f"  {line}")
        print()

    # Mode selection
    while True:
        print("\n" + "=" * 60)
        print("Choose an option:")
        for k, (desc, _) in PRESETS.items():
            print(f"  [{k}] {desc}")
        print("  [c] Custom: Enter your own C-like code")
        print("  [q] Quit")
        print("=" * 60)

        choice = input("Select an option (1-5, c, q) [default: 1]: ").strip().lower()
        if not choice:
            choice = "1"

        if choice == "q":
            print("Exiting.")
            break
        elif choice in PRESETS:
            _, sample_code = PRESETS[choice]
            analyze_c_input(parser, sample_code)
        elif choice == "c":
            print("\nEnter your C-like syntax (end input with an empty line or press Enter):")
            lines = []
            while True:
                try:
                    line = input()
                except EOFError:
                    break
                if not line.strip() and lines:
                    break
                if line.strip():
                    lines.append(line)
            code_input = "\n".join(lines).strip()
            if not code_input:
                print("No input provided.")
                continue
            analyze_c_input(parser, code_input)
        else:
            print("Invalid selection. Please choose 1-5, c, or q.")

if __name__ == "__main__":
    main()
