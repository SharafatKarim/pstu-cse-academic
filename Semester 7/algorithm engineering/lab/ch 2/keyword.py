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
    "import",
    "from",
    "as",
    "class",
    "try",
    "except",
    "finally",
    "with",
    "lambda",
    "yield",
    "global",
    "nonlocal",
    "assert",
    "del",
    "raise",
    "True",
    "False",
    "None",
    "and",
    "or",
    "not",
    "is",
    "in",
    "not in",
    "is not",
    "async",
    "await",
    "do",
    "while",
    "for",
    "in",
    "continue",
    "break",
    "pass",
    "return"
]

identifiers_list = []

def identify_keywords(expression):
    tokens = expression.split()
    identified_keywords = [token for token in tokens if token in keywords]
    identifiers_list.extend([token for token in tokens if token not in keywords and token.isidentifier()])
    return identified_keywords

identified_keywords = identify_keywords("if do x > 0: return x else: return -x")
print(f"Keywords list: {keywords}")
print(f"Kewords count: {len(keywords)}")
print(f"Identified Keywords: {identified_keywords}")
print(f"Identified keywords number: {len(identified_keywords)}")
print(f"Identified Identifiers: {identifiers_list}")
print(f"Identified identifiers number: {len(identifiers_list)}")