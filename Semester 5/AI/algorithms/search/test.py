tree = {
        'A': ['B', 'E'],
        'B': ['C', 'D'],
        'C': ['F'],
        'D': [],
        'E': [],
        'F': []
    }

def dfs_limited(tree, start, limit, visited=[]):
    print(start)
    if limit <= 0:
        return
    if start not in visited:
        print(start, end=" ")
        visited.append(start)
    for node in tree[start]:
        dfs_limited(tree, node, limit-1, visited)

print()
print("DFS limited: ", end="")
dfs_limited(tree, 'A', 3)

print()
print("DFS limited: ", end="")
dfs_limited(tree, 'A', 3)
