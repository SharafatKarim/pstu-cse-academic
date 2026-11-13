import re

def validate_patterns():
    vowel_pattern = r"^[a-z]*a[a-z]*e[a-z]*i[a-z]*o[a-z]*u[a-z]*$"
    def is_lexicographic(s):
        return all(s[i] <= s[i+1] for i in range(len(s)-1)) and s.islower()

    comment_pattern = r"/\*([^*]|\*+[^*/])*\*+/"
    def no_repeated_digits(s):
        return len(set(s)) == len(s) and s.isdigit()

    def at_most_one_repeat(s):
        return len(set(s)) == len(s) or len(set(s)) == len(s) - 1 and s.isdigit()

    def at_most_two_repeats(s):
        return len(set(s)) == len(s) or len(set(s)) == len(s) - 1 or len(set(s)) == len(s) - 2 and s.isdigit()

    avoid_abb = r"^b*(a+b?)*$"
    chess_move = r"^[kqrnbp]*[-x*][a-z0-9]+$"

    print(f"Vowels in order ('abecidofu'): {bool(re.match(vowel_pattern, 'abecidofu'))}")
    print(f"Lexicographic ('abcz'): {is_lexicographic('abcz')}")
    print(f"Comment ('/* hello */'): {bool(re.match(comment_pattern, '/* hello */'))}")
    print(f"No repeats ('1234'): {no_repeated_digits('1234')}")

    print(f"Avoid 'abb' ('aabba'): {bool(re.match(avoid_abb, 'aabba'))}")
    print(f"Avoid 'abb' ('aabbb'): {bool(re.match(avoid_abb, 'aabbb'))}") # False, contains 'abb'

    print(f"Chess move ('p-k4'): {bool(re.match(chess_move, 'p-k4'))}")
    print(f"Chess move ('kbp*qn'): {bool(re.match(chess_move, 'kbp*qn'))}")

if __name__ == "__main__":
    validate_patterns()
