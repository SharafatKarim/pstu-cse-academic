"""
Section 2.3 - Syntax-Directed Translation
Value translation system: integers <-> Roman numerals (1..3999).

  int -> roman   (dragon book exercise: SDT with synthesized .val strings)
  roman -> int   (each symbol contributes +/- its value)
"""
UNITS = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
TENS = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
HUNDREDS = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
THOUSANDS = ["", "M", "MM", "MMM"]
VALUES = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000}


def to_roman(n):
    if not 1 <= n <= 3999:
        return None
    return (THOUSANDS[n // 1000] + HUNDREDS[n // 100 % 10] +
            TENS[n // 10 % 10] + UNITS[n % 10])


def from_roman(s):
    s = s.upper()
    if not s or any(ch not in VALUES for ch in s):
        return None
    total = 0
    for i, ch in enumerate(s):
        sign = -1 if i + 1 < len(s) and VALUES[ch] < VALUES[s[i + 1]] else 1
        total += sign * VALUES[ch]
    return total if to_roman(total) == s else None


if __name__ == "__main__":
    s = input("Enter an integer or a Roman numeral (or press Enter for '1994'): ").strip() or "1994"
    if s.isdigit():
        n = int(s)
        roman = to_roman(n)
        print(f"\nInteger: {n}")
        print(f"SDT: thousands={THOUSANDS[n // 1000]}, hundreds={HUNDREDS[n // 100 % 10]}, "
              f"tens={TENS[n // 10 % 10]}, units={UNITS[n % 10]}")
        print(f"Roman  : {roman if roman else 'out of range 1..3999'}")
    else:
        n = from_roman(s)
        print(f"\nRoman  : {s.upper()}")
        print(f"Integer: {n if n else 'not a valid Roman numeral (1..3999)'}")
