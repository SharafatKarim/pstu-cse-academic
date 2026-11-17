"""
Section 4.8: Using Ambiguous Grammars
- Resolving Shift/Reduce conflicts using Precedence and Associativity
- Example: Operator precedence (+ vs *)
- Example: Dangling-Else resolved by favoring Shift over Reduce
"""

def resolve_precedence_conflict(op_on_stack, next_op):
    """
    Simulates conflict resolution using precedence and associativity:
    Precedence: * > +
    Associativity: left-associative for both
    """
    precedence = {"+": 1, "-": 1, "*": 2, "/": 2}
    
    p_stack = precedence.get(op_on_stack, 0)
    p_next = precedence.get(next_op, 0)
    
    if p_stack > p_next:
        # Stack has higher precedence (e.g. stack has *, input has +) -> REDUCE first
        return "REDUCE"
    elif p_stack < p_next:
        # Input has higher precedence (e.g. stack has +, input has *) -> SHIFT first
        return "SHIFT"
    else:
        # Equal precedence -> Left associative means REDUCE, Right associative means SHIFT
        return "REDUCE (Left-associative)"

def resolve_dangling_else():
    print("--- 2. Dangling-Else Conflict Resolution in LR Parsing ---")
    print("State situation:")
    print("  Stack has: 'if expr then stmt'")
    print("  Input has: 'else'")
    print("Conflict:")
    print("  Action 1: SHIFT 'else' (binds 'else' with the inner 'if')")
    print("  Action 2: REDUCE 'if expr then stmt' to 'stmt' (binds 'else' with outer 'if')")
    print("Resolution:")
    print("  Standard C/Java convention: Resolve in favor of SHIFT.")
    print("  This naturally pairs each 'else' with the most recent unmatched 'if'.")

if __name__ == "__main__":
    print("=== Section 4.8: Resolving Ambiguous Grammars with Precedence ===")
    
    print("\n--- 1. Arithmetic Precedence Conflicts ---")
    cases = [
        ("+", "*", "Stack has E + E ·, lookahead is *"),
        ("*", "+", "Stack has E * E ·, lookahead is +"),
        ("+", "+", "Stack has E + E ·, lookahead is +")
    ]
    for op1, op2, desc in cases:
        action = resolve_precedence_conflict(op1, op2)
        print(f"Scenario: {desc}")
        print(f"  Decision: {action}\n")

    resolve_dangling_else()
