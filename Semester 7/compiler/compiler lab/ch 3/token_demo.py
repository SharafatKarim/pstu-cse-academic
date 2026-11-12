def simple_tokenizer(code):
    tokens = code.split()

    results = []
    for lexeme in tokens:
        # Categorization logic
        if lexeme in [# Python
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
        "style", "script", "link", "meta", "title", "head", "body", "html"]:
            token_type = "KEYWORD"
        elif lexeme in ["+", "-", "*", "/", "=", "==", "!=", "<", ">", "<=", ">=", "&", "|", "&&", "||"]:
            token_type = "OPERATOR"
        elif lexeme.endswith(";"):
            results.append((lexeme[:-1], "IDENTIFIER"))
            results.append((";", "PUNCTUATION"))
            continue
        elif lexeme.isdigit():
            token_type = "NUMBER"
        else:
            token_type = "IDENTIFIER"

        results.append((lexeme, token_type))

    return results

if __name__ == "__main__":
    sample_code = "int count = 10 <body> hello </body>"
    print(f"Code: {sample_code}")
    print("Tokens:")
    for lexeme, t_type in simple_tokenizer(sample_code):
        print(f"  <{t_type}, '{lexeme}'>")
