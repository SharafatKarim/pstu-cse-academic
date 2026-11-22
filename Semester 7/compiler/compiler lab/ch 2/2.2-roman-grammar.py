"""
Section 2.2 - Syntax Definition: Real-World Grammars
Context-free grammar for a subset of Roman numerals (1 .. 3999).

  Roman    -> Thousands Hundreds Tens Units
  Thousands -> epsilon | M | MM | MMM
  Hundreds  -> epsilon | C | CC | CCC | CD | D | DC | DCC | DCCC | CM
  Tens      -> epsilon | X | XX | XXX | XL | L | LX | LXX | LXXX | XC
  Units     -> epsilon | I | II | III | IV | V | VI | VII | VIII | IX
"""
GROUPS = [
    ("M", ["", "M", "MM", "MMM"]),
    ("C", ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]),
    ("X", ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]),
    ("I", ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]),
]
VALUES = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000}


def parse(s):
    """Consume the four groups in order, choosing the longest match in each."""
    pieces = []
    rest = s
    for _, forms in GROUPS:
        form = max((f for f in forms if rest.startswith(f)), key=len, default="")
        pieces.append(form)
        rest = rest[len(form):]
    if rest or not any(pieces):
        return None
    return pieces


def value_of(s):
    total = 0
    for i, ch in enumerate(s):
        sign = -1 if i + 1 < len(s) and VALUES[ch] < VALUES[s[i + 1]] else 1
        total += sign * VALUES[ch]
    return total


if __name__ == "__main__":
    print("Grammar: Roman -> Thousands Hundreds Tens Units")
    for name, forms in GROUPS:
        print(f"  {name + ' ->':<11} " + " | ".join(f or "epsilon" for f in forms))

    s = input("\nEnter a Roman numeral (or press Enter for 'MCMLIV'): ").strip().upper() or "MCMLIV"
    pieces = parse(s)
    print(f"\nInput : {s}")
    if pieces is None:
        print("Result: REJECTED - not in the Roman-numeral subset (1..3999).")
    else:
        labels = ["Thousands", "Hundreds", "Tens", "Units"]
        print("Derivation: Roman -> " + " + ".join(f"{lab}={p or 'epsilon'}" for lab, p in zip(labels, pieces)))
        print(f"Result: ACCEPTED - value = {value_of(s)}")
