# white space remove 

line = 0
def remove_whitespace(expression):
    global line
    line += expression.count('\n')
    expression = expression.replace('\n', ' ')
    return expression.replace(" ", "")

remove_whitespace("  95 + 5 * 2 \n")

print(f"Line Count: {line}")
print(f"Expression without whitespace: '{remove_whitespace('  95 + 5 * 2 \n')}'")