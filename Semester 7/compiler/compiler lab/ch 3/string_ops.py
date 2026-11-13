def get_prefixes(s):
    """A prefix is any string formed by taking zero or more symbols from the end of s."""
    prefixes = []
    for i in range(len(s) + 1):
        prefixes.append(s[:i])
    return prefixes

def get_suffixes(s):
    """A suffix is any string formed by deleting zero or more symbols from the beginning of s."""
    suffixes = []
    for i in range(len(s) + 1):
        suffixes.append(s[i:])
    return suffixes

def get_substrings(s):
    """A substring is obtained by deleting a prefix and a suffix from s."""
    substrings = {""}
    for i in range(len(s)):
        for j in range(i + 1, len(s) + 1):
            substrings.add(s[i:j])
    return sorted(list(substrings), key=len)

if __name__ == "__main__":
    code = "int count = 10"
    print(f"Code: '{code}'\n")

    lexemes = code.split()

    for lexeme in lexemes:
        print(f"--- Lexeme: '{lexeme}' ---")
        print(f"Prefixes:  {get_prefixes(lexeme)}")
        print(f"Suffixes:  {get_suffixes(lexeme)}")
        print(f"Substrings: {get_substrings(lexeme)}")
        print()
