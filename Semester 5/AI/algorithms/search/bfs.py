from collections import deque

tree = {
        'A': ['B', 'E'],
        'B': ['C', 'D'],
        'C': ['F'],
        'D': [],
        'E': [],
        'F': []
    }

def bfs(tree, start):
    visited = []
    queue = deque([start])

    while queue:
        node = queue.popleft()
        if node not in visited:
            visited.append(node)
            print(node, end=" ")

            for neighbor in tree[node]:
                if neighbor not in visited:
                    queue.append(neighbor)

def dfs(tree, start, visited = []):
    if start not in visited:
        print(start, end=" ")
        visited.append(start)
    for node in tree[start]:
        dfs(tree, node, visited)

def dfs_limited(tree, start, limit, visited=[]):
    if limit <= 0:
        return
    if start not in visited:
        print(start, end=" ")
        visited.append(start)
    for node in tree[start]:
        dfs_limited(tree, node, limit-1, visited)

if __name__ == "__main__":
    print("BFS: ", end="")
    bfs(tree, 'A')

    print()
    print("DFS: ", end="")
    dfs(tree, 'A')

    print()
    print("DFS limited: ", end="")
    dfs_limited(tree, 'A', 3)
