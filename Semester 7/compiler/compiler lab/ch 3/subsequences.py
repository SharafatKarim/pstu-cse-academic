# Subsequences and String terminology
# Unlike substrings, subsequences don't have to be contiguous.

def is_subsequence(sub, full):
    """Checks if 'sub' is a subsequence of 'full'."""
    it = iter(full)
    # Check if every character in 'sub' appears in 'full' in order
    return all(c in it for c in sub)

if __name__ == "__main__":
    word = "apple"
    print(f"Word: {word}")
    print(f"Is 'ale' a subsequence? {is_subsequence('ale', word)}") # True
    print(f"Is 'ale' a substring?   {'ale' in word}")               # False
