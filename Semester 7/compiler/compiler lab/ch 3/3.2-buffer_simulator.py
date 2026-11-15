def simulate_buffer(source_code):
    buffer = list(source_code) + ['EOF']

    lexeme_begin = 0
    forward = 0

    print(f"Source: {source_code}")
    print("-" * 30)

    while forward < len(buffer):
        char = buffer[forward]

        if char == 'EOF':
            print("End of Input reached.")
            break

        if char in ['<', '>', '=', '!']:
            forward += 1
            next_char = buffer[forward]

            combined = char + next_char

            if combined in ['<=', '<>', '>=', '==', '!=']:
                print(f"Found Token: {combined:2} (No retraction needed)")
                forward += 1
            else:
                if char == '!':
                    print(f"Found Error: ! (Single '!' not a valid operator)")
                else:
                    print(f"Found Token: {char:2} (Retracting: pointer was at '{next_char}')")

            lexeme_begin = forward
            continue

        if char.isspace():
            forward += 1
            lexeme_begin = forward
            continue

        if char.isalpha():
            while forward < len(buffer) and buffer[forward].isalnum() and buffer[forward] != 'EOF':
                forward += 1

            lexeme = "".join(buffer[lexeme_begin:forward])
            print(f"Found Lexeme: {lexeme}")
            lexeme_begin = forward
            continue

        if char.isdigit():
            while forward < len(buffer) and buffer[forward].isdigit() and buffer[forward] != 'EOF':
                forward += 1

            lexeme = "".join(buffer[lexeme_begin:forward])
            print(f"Found Token:  {lexeme} (Number)")
            lexeme_begin = forward
            continue

        forward += 1

if __name__ == "__main__":
    code_snippet = "count >= 10 if x <> 5 and y != 0 or a < b"
    simulate_buffer(code_snippet)
