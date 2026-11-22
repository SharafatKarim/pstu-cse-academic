keywords = [
    # Python
    "False", "None", "True", "and", "as", "assert", "async", "await",
    "break", "class", "continue", "def", "del", "elif", "else", "except",
    "finally", "for", "from", "global", "if", "import", "in", "is",
    "lambda", "nonlocal", "not", "or", "pass", "raise", "return", "try",
    "while", "with", "yield",

    # C / C++ / Java / C#
    "auto", "bool", "byte", "case", "catch", "char", "checked", "const",
    "decimal", "default", "delegate", "do", "double", "dynamic", "enum",
    "event", "explicit", "extern", "extern", "finally", "fixed", "float",
    "foreach", "goto", "implicit", "int", "interface", "internal", "lock",
    "long", "namespace", "new", "null", "object", "operator", "out",
    "override", "params", "private", "protected", "public", "readonly",
    "ref", "sbyte", "sealed", "short", "sizeof", "stackalloc", "static",
    "string", "struct", "switch", "this", "throw", "typeof", "uint",
    "ulong", "unchecked", "unsafe", "ushort", "using", "virtual", "void",
    "volatile",

    # Additional common language keywords
    "strictfp", "native", "transient", "synchronized", "abstract", "final",
    "extends", "implements", "instanceof", "interface", "package", "super",
    "throws", "var", "const", "let",

    # HTML, XML, CSS, JavaScript
    "document", "window", "console", "alert", "getElementById", "querySelector",
    "addEventListener", "innerHTML", "style", "createElement", "appendChild", "removeChild",
    "innerText", "getAttribute", "setAttribute", "removeAttribute",
    "div", "span", "a", "img", "input", "button", "textarea", "select", "option",
    "ul", "ol", "li", "table", "tr", "td", "th", "thead", "tbody", "tfoot",
    "style", "script", "link", "meta", "title", "head", "body", "html"
]

identifiers_list = []


def identify_keywords(expression):
    tokens = expression.split()
    identified_keywords = [token for token in tokens if token in keywords]
    identifiers_list.extend(
        [token for token in tokens if token not in keywords and token.isidentifier()]
    )
    return identified_keywords


identified_keywords = identify_keywords("if do x > 0: return x else: return -x")
print(f"Keywords list: {keywords}")
print(f"Kewords count: {len(keywords)}")
print(f"Identified Keywords: {identified_keywords}")
print(f"Identified keywords number: {len(identified_keywords)}")
print(f"Identified Identifiers: {identifiers_list}")
print(f"Identified identifiers number: {len(identifiers_list)}")
