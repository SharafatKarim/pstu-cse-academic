keywords = [
    "if",
    "else",
    "while",
    "for",
    "return",
    "def",
    "break",
    "continue",
    "pass",
]

def identify_keywords(expression):
    tokens = expression.split()
    identified_keywords = [token for token in tokens if token in keywords]
    return identified_keywords

identified_keywords = identify_keywords("if x > 0: return x else: return -x")
print(f"Identified Keywords: {identified_keywords}")