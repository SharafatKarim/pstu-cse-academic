# Transition Diagram (State Machine) Implementation
# This script uses a state machine to recognize tokens and can visualize the diagram.

try:
    from graphviz import Digraph
except ImportError:
    Digraph = None

def visualize_relop_diagram():
    """Generates a PDF visualization of the Relational Operator Transition Diagram."""
    if not Digraph:
        print("Graphviz not installed. Run 'pip install graphviz' to enable visualization.")
        return

    dot = Digraph(comment='Relational Operator Transition Diagram')
    dot.attr(rankdir='LR')

    # States
    dot.node('0', 'Start (0)')
    dot.node('1', '1')
    dot.node('2', '2 (Accept <=)', shape='doublecircle')
    dot.node('3', '3 (Accept <>)', shape='doublecircle')
    dot.node('4', '4 (Accept <, Retract)', shape='doublecircle')
    dot.node('5', '5 (Accept =)', shape='doublecircle')
    dot.node('6', '6')
    dot.node('7', '7 (Accept >=)', shape='doublecircle')
    dot.node('8', '8 (Accept >, Retract)', shape='doublecircle')

    # Transitions
    dot.edge('0', '1', label='<')
    dot.edge('0', '5', label='=')
    dot.edge('0', '6', label='>')

    dot.edge('1', '2', label='=')
    dot.edge('1', '3', label='>')
    dot.edge('1', '4', label='other')

    dot.edge('6', '7', label='=')
    dot.edge('6', '8', label='other')

    try:
        dot.render('relop_diagram', format='png', cleanup=True)
        print("Transition diagram saved as 'relop_diagram.png'")
    except Exception as e:
        print(f"Could not render diagram: {e}")

def get_relop(text):
    """
    Simulation of the Transition Diagram for Relational Operators.
    Referencing logic from token_demo.py's RELATIONAL_OPERATOR category.
    """
    state = 0
    forward = 0

    # We add a space to trigger 'other' transitions (retraction) at the end of input
    buffer = text + " "

    while forward < len(buffer):
        char = buffer[forward]

        if state == 0:
            if char == '<': state = 1
            elif char == '=': state = 5
            elif char == '>': state = 6
            else: return None, forward

        elif state == 1:
            if char == '=': return "<=", forward + 1
            elif char == '>': return "<>", forward + 1
            else: return "<", forward # Retract (state 4)

        elif state == 5:
            return "=", forward + 1 # Accept =

        elif state == 6:
            if char == '=': return ">=", forward + 1
            else: return ">", forward # Retract (state 8)

        forward += 1
    return None, forward

def get_identifier(text, start):
    """Transition diagram for Identifiers: Letter(Letter|Digit)*"""
    state = 0
    forward = start
    while forward < len(text):
        char = text[forward]
        if state == 0:
            if char.isalpha() or char == '_':
                state = 1
            else: return None, start
        elif state == 1:
            if not (char.isalnum() or char == '_'):
                return text[start:forward], forward
        forward += 1
    return text[start:forward], forward if state == 1 else start

def get_number(text, start):
    """Transition diagram for Numbers: Digit+"""
    state = 0
    forward = start
    while forward < len(text):
        char = text[forward]
        if state == 0:
            if char.isdigit(): state = 1
            else: return None, start
        elif state == 1:
            if not char.isdigit():
                return text[start:forward], forward
        forward += 1
    return text[start:forward], forward if state == 1 else start

def scan_source(source_code):
    """Uses various Transition Diagrams to tokenize a source string."""
    i = 0
    tokens = []
    print(f"Scanning Code: {source_code}\n")

    while i < len(source_code):
        char = source_code[i]

        if char.isspace():
            i += 1
            continue

        # Try Relational Operator Diagram
        res, next_i = get_relop(source_code[i:])
        if res:
            tokens.append(("RELOP", res))
            i += next_i
            continue

        # Try Identifier Diagram
        res, next_i = get_identifier(source_code, i)
        if res:
            tokens.append(("ID/KEY", res))
            i = next_i
            continue

        # Try Number Diagram
        res, next_i = get_number(source_code, i)
        if res:
            tokens.append(("NUM", res))
            i = next_i
            continue

        # Basic fallback for single chars
        tokens.append(("PUNC", char))
        i += 1

    return tokens

if __name__ == "__main__":
    # 1. Visualization
    visualize_relop_diagram()

    # 2. Source Code Scanning
    source = "if count > 1 then x = 2"
    results = scan_source(source)

    print("Tokens found via Transition Diagrams:")
    for t_type, lexeme in results:
        print(f"  <{t_type:6}, '{lexeme}'>")
