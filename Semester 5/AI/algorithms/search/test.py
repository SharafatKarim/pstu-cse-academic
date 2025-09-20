tree = {
        'a': ['b', 'c'],
        'b': ['c', 'e'],
        'c': ['d'],
        'd': ['e'],
        'e': ['f'],
        'f': []
    }

def dfs(graph, start, limit=float('inf')):
    if limit <= 0:
        return
    visited = []
    if start not in visited:
        print(start, end=', ')
        visited.append(start)
    for i in graph[start]:
        dfs(graph, i, limit-1)


if __name__ == '__main__':
    dfs(tree, 'a', 1)
