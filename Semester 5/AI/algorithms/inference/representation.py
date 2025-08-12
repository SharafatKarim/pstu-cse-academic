class Relation:
    R = {}
    def add(self, rel, head, body):
        self.R[rel] = []
        self.R[rel].append(head)
        self.R[rel].append(body)

    def print_all(self):
        print(self.R, end="")
    def relations(self):
        return self.R.keys()

    def print(self, rel):
        print(f"{self.R[rel][0]} is a {self.R[rel][1]}", end="")
    def print_not(self, rel):
        print(f"{self.R[rel][0]} is not a {self.R[rel][1]}", end="")

def build_statement(rel, query):
    heads = R.relations()
    not_next = False
    for i in query:
        if i in heads:
            if not_next:
                rel.print_not(i)
                not_next = False
            else:
                rel.print(i)
        elif i == "!":
            not_next = True
        else:
            print(i, end="")

def pre_process(query):
    query = query.replace(" ", "")
    query = query.replace("(", "")
    query = query.replace(")", "")
    query = query.replace("&", " and ")
    query = query.replace("|", " or ")
    query = query.replace("~", " then, ")
    build_statement(R, query)

# ! = not
# & = and
# | = or
# ~ = implies

R = Relation();
R.add("P", "Maynul", "good boy")
R.add("Q", "Maynul", "sweet boy")
R.add("R", "Rajesh", "good programmer")
R.add("T", "Rajesh", "veteran clasher")
R.add("S", "Sadman", "IOT expert boy")
R.add("U", "Sadman", "hard working boy")

pre_process("(P & !Q) ~ P")

print()
print()

pre_process("T & S | !U ~ R")
