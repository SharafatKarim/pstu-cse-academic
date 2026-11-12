# Transition Diagram (State Machine) Implementation
# This simulates how a scanner moves between states to recognize tokens.

def get_relop(text):
    state = 0
    forward = 0
    lexeme = ""

    while forward < len(text):
        char = text[forward]
        
        if state == 0:
            if char == '<':
                state = 1
            elif char == '=':
                state = 5
            elif char == '>':
                state = 6
            else:
                return None, forward # Not a relop
        
        elif state == 1:
            if char == '=':
                state = 2
            elif char == '>':
                state = 3
            else:
                state = 4 # Retract
        
        # Final States
        if state == 2: return "<=", forward + 1
        if state == 3: return "<>", forward + 1
        if state == 4: return "<",  forward     # Note: No +1 because we retract
        if state == 5: return "=",  forward + 1
        
        if state == 6:
            if char == '=':
                state = 7
            else:
                state = 8 # Retract
        
        if state == 7: return ">=", forward + 1
        if state == 8: return ">",  forward

        forward += 1
    return None, forward

if __name__ == "__main__":
    tests = ["<=", ">", "<", ">=", "<>", "="]
    for t in tests:
        token, pos = get_relop(t)
        print(f"Input: {t:3} | Recognized: {token:3}")
