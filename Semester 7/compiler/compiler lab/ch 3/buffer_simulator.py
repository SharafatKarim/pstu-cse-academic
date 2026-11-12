# Input Buffering with Sentinels
# This script simulates how a compiler reads chunks of code into a buffer
# and uses pointers to identify lexemes.

def simulate_buffer(source_code):
    # We use 'EOF' as a sentinel character
    buffer = list(source_code) + ['EOF']
    
    lexeme_begin = 0
    forward = 0
    
    print(f"Source: {source_code}")
    print("-" * 30)

    while forward < len(buffer):
        char = buffer[forward]
        
        # If we hit the sentinel
        if char == 'EOF':
            print("End of Input reached.")
            break
            
        # Example: Recognizing a relational operator like '>=' or '>'
        if char == '>':
            # Move forward to lookahead
            forward += 1 
            next_char = buffer[forward]
            
            if next_char == '=':
                print(f"Found Token: >=  (No retraction needed)")
                forward += 1
            else:
                print(f"Found Token: >   (Retracting: pointer was at '{next_char}')")
                # Retraction happens here conceptually: 
                # we don't increment 'forward' further, 
                # effectively leaving next_char for the next loop.
            
            lexeme_begin = forward
            continue

        # Skip whitespace (as you requested)
        if char.isspace():
            forward += 1
            lexeme_begin = forward
            continue
            
        # Simple Identifier/Letter reader
        if char.isalpha():
            while buffer[forward].isalnum():
                forward += 1
            
            lexeme = "".join(buffer[lexeme_begin:forward])
            print(f"Found Lexeme: {lexeme}")
            lexeme_begin = forward
            continue

        forward += 1

if __name__ == "__main__":
    # Test case: '>' followed by a letter requires retraction
    # Test case: '>=' followed by a letter does not
    simulate_buffer("count > 10")
    print("\nNext Test:")
    simulate_buffer("count >= 10")
