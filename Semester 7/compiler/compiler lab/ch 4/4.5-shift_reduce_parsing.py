"""
Section 4.5: Bottom-Up Parsing & Shift-Reduce Concepts
- Handles and Handle Pruning
- Shift-Reduce parser trace
- Shift-Reduce and Reduce-Reduce conflict concepts
"""

class ShiftReduceParser:
    def __init__(self, grammar_rules):
        """
        grammar_rules: list of (LHS, [RHS symbols]) in reduction preference order
        """
        self.rules = grammar_rules

    def find_handle(self, stack):
        """
        Finds the longest suffix of stack that matches any production RHS.
        Returns (rule_index, LHS, RHS) or None.
        """
        for idx, (lhs, rhs) in enumerate(self.rules):
            k = len(rhs)
            if len(stack) >= k and stack[-k:] == rhs:
                return idx, lhs, rhs
        return None

    def parse(self, tokens):
        stack = []
        input_tokens = list(tokens) + ["$"]
        ip = 0

        print(f"\n{'Stack':<25} {'Input':<25} {'Action'}")
        print("-" * 65)

        start_lhs = self.rules[0][0]

        while True:
            stack_str = " ".join(stack) if stack else "$"
            input_str = " ".join(input_tokens[ip:])

            # Check if accepted
            if stack == [start_lhs] and input_tokens[ip] == "$":
                print(f"{stack_str:<25} {input_str:<25} Accept")
                return True

            # Check if a handle exists on the stack
            handle = self.find_handle(stack)
            if handle:
                idx, lhs, rhs = handle
                k = len(rhs)
                print(f"{stack_str:<25} {input_str:<25} Reduce by {lhs} -> {' '.join(rhs)}")
                # Pop RHS and push LHS
                del stack[-k:]
                stack.append(lhs)
            else:
                # Shift next token if available
                if input_tokens[ip] != "$":
                    shifted = input_tokens[ip]
                    print(f"{stack_str:<25} {input_str:<25} Shift '{shifted}'")
                    stack.append(shifted)
                    ip += 1
                else:
                    print(f"{stack_str:<25} {input_str:<25} Error: Syntax error (No handle and no input)")
                    return False

def explain_conflicts():
    print("\n--- Conflict Analysis in Shift-Reduce Parsing ---")
    print("1. Shift-Reduce Conflict:")
    print("   Occurs when the parser cannot decide whether to shift the next input symbol")
    print("   or reduce the current handle on top of the stack.")
    print("   Classic example: Dangling-else statement:")
    print("   Stack has: 'if expr then stmt', Input has: 'else'")
    print("   - Shift: bind 'else' with innermost 'if'")
    print("   - Reduce: treat 'if expr then stmt' as complete statement")
    print("\n2. Reduce-Reduce Conflict:")
    print("   Occurs when the top of the stack matches the RHS of two or more different rules,")
    print("   and the parser cannot decide which reduction to apply.")
    print("   Example:")
    print("   A -> id")
    print("   B -> id")
    print("   Stack has: 'id'. Both A -> id and B -> id are valid reductions.")

if __name__ == "__main__":
    print("=== Section 4.5: Bottom-Up & Shift-Reduce Parsing ===")

    # Grammar:
    # 0: E -> E + T
    # 1: E -> T
    # 2: T -> T * F
    # 3: T -> F
    # 4: F -> ( E )
    # 5: F -> id
    grammar_rules = [
        ("E", ["E", "+", "T"]),
        ("E", ["T"]),
        ("T", ["T", "*", "F"]),
        ("T", ["F"]),
        ("F", ["(", "E", ")"]),
        ("F", ["id"])
    ]

    parser = ShiftReduceParser(grammar_rules)
    test_input = ["id", "+", "id", "*", "id"]
    
    print(f"\nTrace for input: {' '.join(test_input)}")
    parser.parse(test_input)

    explain_conflicts()
