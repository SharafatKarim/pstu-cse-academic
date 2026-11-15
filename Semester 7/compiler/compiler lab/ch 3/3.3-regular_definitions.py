import re

# Regular expression patterns and helpers available at module level
vowel_pattern = r"^[a-z]*a[a-z]*e[a-z]*i[a-z]*o[a-z]*u[a-z]*$"
digit_pattern = r"^\d+$"
identifier_pattern = r"^[a-zA-Z_][a-zA-Z0-9_]*$"
comment_pattern = r"/\*([^*]|\*+[^*/])*\*+/"
avoid_abb = r"^b*(a+b?)*$"
chess_move = r"^[kqrnbp]*[-x*][a-z0-9]+$"

def is_lexicographic(s):
    return all(s[i] <= s[i+1] for i in range(len(s)-1)) and s.islower()

def no_repeated_digits(s):
    return len(set(s)) == len(s) and s.isdigit()

def at_most_one_repeat(s):
    return (len(set(s)) == len(s) or len(set(s)) == len(s) - 1) and s.isdigit()

def at_most_two_repeats(s):
    return (len(set(s)) in (len(s), len(s) - 1, len(s) - 2)) and s.isdigit()


def validate_patterns():
# Tests / Demonstrations
    pass
#     print(f"Vowels in order ('abecidofu'): {bool(re.match(vowel_pattern, 'abecidofu'))}")
#     print(f"Lexicographic ('abcz'): {is_lexicographic('abcz')}")
#     print(f"Comment ('/* hello */'): {bool(re.match(comment_pattern, '/* hello */'))}")
#     print(f"No repeats ('1234'): {no_repeated_digits('1234')}")
#
#     print(f"Avoid 'abb' ('aabba'): {bool(re.match(avoid_abb, 'aabba'))}")
#     print(f"Avoid 'abb' ('aabbb'): {bool(re.match(avoid_abb, 'aabbb'))}") # False, contains 'abb'
#
#     print(f"Chess move ('p-k4'): {bool(re.match(chess_move, 'p-k4'))}")
#     print(f"Chess move ('kbp*qn'): {bool(re.match(chess_move, 'kbp*qn'))}")

if __name__ == "__main__":
    validate_patterns()
    test_string = input("")
    # check if digit or identifier or vowel in order or lexicographic or others
    if bool(re.match(digit_pattern, test_string)):
        print(f"Digit: {test_string}")
    elif bool(re.match(identifier_pattern, test_string)):
        print(f"Identifier: {test_string}")
    elif bool(re.match(vowel_pattern, test_string)):
        print(f"Vowel in order: {test_string}")
    elif bool(re.match(comment_pattern, test_string)):
        print(f"Comment: {test_string}")
    elif is_lexicographic(test_string):
        print(f"Lexicographic: {test_string}")
    else:
        print(f"Other: {test_string}")
