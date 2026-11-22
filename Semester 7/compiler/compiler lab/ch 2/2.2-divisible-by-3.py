"""
Section 2.2 - Syntax Definition: Advanced Proof / Puzzle
Grammar for binary strings whose numeric value is divisible by 3.

Each nonterminal records the remainder so far (mod 3):
    S -> 0 S | 1 A | epsilon     (S: remainder 0, accepting)
    A -> 0 B | 1 S               (A: remainder 1)
    B -> 0 A | 1 B               (B: remainder 2)

Reading a bit d from remainder r goes to (2*r + d) mod 3, so after the whole
string the state equals the value mod 3; only S (remainder 0) can finish.
"""
TRANSITIONS = {
    "S": {"0": ("0 S", "S"), "1": ("1 A", "A")},
    "A": {"0": ("0 B", "B"), "1": ("1 S", "S")},
    "B": {"0": ("0 A", "A"), "1": ("1 B", "B")},
}

GRAMMAR_TEXT = """  S -> 0 S | 1 A | epsilon
  A -> 0 B | 1 S
  B -> 0 A | 1 B"""


def derive(s):
    state = "S"
    form = ["S"]
    steps = []
    for bit in s:
        old_state = state
        rhs, state = TRANSITIONS[state][bit]
        pos = next(i for i, sym in enumerate(form) if sym in "SAB")
        form[pos:pos + 1] = rhs.split()
        steps.append((f"{old_state} -> {rhs}", " ".join(form)))
    if state == "S":
        pos = next(i for i, sym in enumerate(form) if sym in "SAB")
        form[pos:pos + 1] = []
        steps.append(("S -> epsilon", " ".join(form) or "epsilon"))
        return True, steps
    return False, steps


if __name__ == "__main__":
    print("Grammar (remainder = value mod 3):")
    print(GRAMMAR_TEXT)
    s = input("\nEnter a binary string (or press Enter for '110'): ").strip() or "110"
    if any(ch not in "01" for ch in s):
        print("Input must contain only 0 and 1.")
    else:
        value = int(s, 2)
        ok, steps = derive(s)
        print(f"\nBinary   : {s}")
        print(f"Value    : {value}   ({value} mod 3 = {value % 3})")
        print("\nDerivation (grammar simulation):")
        print("  S")
        for rule, sentential in steps:
            print(f"  => {sentential:<20} ({rule})")
        print(f"\nFinal state: {'S (remainder 0)' if ok else 'not S'}")
        print(f"Result     : {'ACCEPTED - divisible by 3' if ok else 'REJECTED - not divisible by 3'}")
