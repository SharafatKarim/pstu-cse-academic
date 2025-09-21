from collections import deque
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

def bfs(graph, start):
    visited = []
    queue = deque()
    queue.pushfront(start)

    while (queue):
        node = queue.popleft()
        if node not in visited:
            print(node, end=', ')
            visited.append(node)

            for i in graph[node]:
                if i not in visited:
                    queue.push(i)

if __name__ == '__main__':
    dfs(tree, 'a', 1)
    # bfs(tree, 'a')
    print(dir(deque))
