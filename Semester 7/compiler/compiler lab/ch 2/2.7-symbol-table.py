"""
Section 2.7 - Symbol Tables
Linked symbol table with one linked list per scope and a scope stack for
nested blocks. Commands (one per line):

  enter            - open a new scope
  leave            - close the current scope
  declare NAME TYPE - declare in current scope (shadowing allowed)
  lookup NAME      - search from innermost scope outward
  print            - display all scopes
  quit             - exit
"""
scopes = []          # innermost scope is at the end


class Entry:
    def __init__(self, name, typ, next_entry=None):
        self.name = name
        self.typ = typ
        self.next = next_entry

    def __str__(self):
        return f"{self.name}:{self.typ}"


def declare(name, typ):
    if not scopes:
        scopes.append({"head": None})
    head = scopes[-1]["head"]
    scopes[-1]["head"] = Entry(name, typ, head)


def lookup(name):
    for depth in range(len(scopes) - 1, -1, -1):
        entry = scopes[depth]["head"]
        while entry:
            if entry.name == name:
                return entry, depth
            entry = entry.next
    return None, None


def show():
    if not scopes:
        print("  (no scopes)")
    for depth in range(len(scopes) - 1, -1, -1):
        chain, entry = [], scopes[depth]["head"]
        while entry:
            chain.append(str(entry))
            entry = entry.next
        print(f"  scope {depth}: " + (" -> ".join(chain) if chain else "empty"))


if __name__ == "__main__":
    print("Commands: enter | leave | declare NAME TYPE | lookup NAME | print | quit")
    first = True
    while True:
        try:
            line = input("> ").strip()
        except EOFError:
            break
        if first and not line:
            demo = ["declare x int", "enter", "declare x float", "lookup x", "print", "leave", "lookup x", "quit"]
            print("Running demo (no input given):")
            for cmd in demo:
                print("> " + cmd)
                parts = cmd.split()
                if cmd == "enter":
                    scopes.append({"head": None})
                elif cmd == "leave" and len(scopes) > 1:
                    scopes.pop()
                elif parts[0] == "declare":
                    declare(parts[1], parts[2])
                elif parts[0] == "lookup":
                    e, d = lookup(parts[1])
                    print(f"  found in scope {d} as {e}" if e else "  not found")
                elif cmd == "print":
                    show()
            break
        first = False
        if not line or line == "quit":
            break
        parts = line.split()
        if line == "enter":
            scopes.append({"head": None})
            print(f"  entered scope {len(scopes) - 1}")
        elif line == "leave":
            if len(scopes) > 1:
                scopes.pop()
                print("  left scope")
            else:
                print("  cannot leave the outermost scope")
        elif parts[0] == "declare" and len(parts) == 3:
            declare(parts[1], parts[2])
            print(f"  declared {parts[1]} as {parts[2]} in scope {len(scopes) - 1}")
        elif parts[0] == "lookup" and len(parts) == 2:
            e, d = lookup(parts[1])
            print(f"  found in scope {d} as {e}" if e else "  not found")
        elif line == "print":
            show()
        else:
            print("  unknown command")
