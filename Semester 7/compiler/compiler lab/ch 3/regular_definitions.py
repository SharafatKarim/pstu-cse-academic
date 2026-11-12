import re

# Regular Definitions implemented via Python Regex

def validate_patterns():
    # 1. Lowercase letters containing five vowels in alphabetical order
    # Pattern: any letters, then 'a', any letters, 'e' ... 'u', any letters
    vowel_pattern = r"^[a-z]*a[a-z]*e[a-z]*i[a-z]*o[a-z]*u[a-z]*$"
    
    # 2. Lowercase letters in ascending lexicographic order (e.g., "abcz")
    # This is hard to do with a single standard Regex, so we use a small helper
    def is_lexicographic(s):
        return all(s[i] <= s[i+1] for i in range(len(s)-1)) and s.islower()

    # 3. Comments: /* ... */ without nesting
    # Regex: /* then (anything not a *) OR (* not followed by /) then */
    comment_pattern = r"/\*([^*]|\*+[^*/])*\*+/"

    # 4. No repeated digits
    def no_repeated_digits(s):
        return len(set(s)) == len(s) and s.isdigit()

    # Tests
    print(f"Vowels in order ('abecidofu'): {bool(re.match(vowel_pattern, 'abecidofu'))}")
    print(f"Lexicographic ('abcz'): {is_lexicographic('abcz')}")
    print(f"Comment ('/* hello */'): {bool(re.match(comment_pattern, '/* hello */'))}")
    print(f"No repeats ('1234'): {no_repeated_digits('1234')}")
    print(f"No repeats ('112'): {no_repeated_digits('112')}")

if __name__ == "__main__":
    validate_patterns()
