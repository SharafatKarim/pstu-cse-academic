from collections import deque
from heapq import heappush, heappop

G = {
    "Arad": [("Zerind", 75), ("Sibiu", 140), ("Timisoara", 118)],
    "Zerind": [("Arad", 75), ("Oradea", 71)],
    "Oradea": [("Zerind", 71), ("Sibiu", 151)],
    "Timisoara": [("Arad", 118), ("Lugoj", 111)],
    "Lugoj": [("Timisoara", 111), ("Mehadia", 70)],
    "Mehadia": [("Lugoj", 70), ("Drobeta", 75)],
    "Drobeta": [("Mehadia", 75), ("Craiova", 120)],
    "Craiova": [("Drobeta", 120), ("Rimnicu Vilcea", 146), ("Pitesti", 138)],
    "Sibiu": [("Arad", 140), ("Oradea", 151), ("Fagaras", 99), ("Rimnicu Vilcea", 80)],
    "Fagaras": [("Sibiu", 99), ("Bucharest", 211)],
    "Rimnicu Vilcea": [("Sibiu", 80), ("Craiova", 146), ("Pitesti", 97)],
    "Pitesti": [("Rimnicu Vilcea", 97), ("Craiova", 138), ("Bucharest", 101)],
    "Bucharest": [("Fagaras", 211), ("Pitesti", 101), ("Giurgiu", 90), ("Urziceni", 85)],
    "Giurgiu": [("Bucharest", 90)],
    "Urziceni": [("Bucharest", 85), ("Hirsova", 98), ("Vaslui", 142)],
    "Hirsova": [("Urziceni", 98), ("Eforie", 86)],
    "Eforie": [("Hirsova", 86)],
    "Vaslui": [("Urziceni", 142), ("Iasi", 92)],
    "Iasi": [("Vaslui", 92), ("Neamt", 87)],
    "Neamt": [("Iasi", 87)],
}

H = {
    "Arad": 366, "Bucharest": 0, "Craiova": 160, "Drobeta": 242, "Eforie": 161,
    "Fagaras": 176, "Giurgiu": 77, "Hirsova": 151, "Iasi": 226, "Lugoj": 244,
    "Mehadia": 241, "Neamt": 234, "Oradea": 380, "Pitesti": 100,
    "Rimnicu Vilcea": 193, "Sibiu": 253, "Timisoara": 329, "Urziceni": 80,
    "Vaslui": 199, "Zerind": 374,
}

tree = {
        'a': ['b', 'c'],
        'b': ['c', 'e'],
        'c': ['d'],
        'd': ['e'],
        'e': ['f'],
        'f': []
    }

graph = {
        'a' : [('b', 1), ('c', 2)],
        'b' : [('c', 1), ('d', 4)],
        'c' : [],
        'd' : []
    }

def ucs(g, start, finish):
    visited = {start: 0}
    heap = []
    heappush(heap, (0, start, [start]))

    while heap:
        cost, node, path = heappop(heap)
        if node == finish:
            return cost, node, path

        for i, j in g[node]:
            if i not in visited or cost+j <= visited[i]:
                visited[i] = cost + j
                heappush(heap, (cost+j, i, path + [i]))

    return None, None, None

def greedy_bfs(g, h, start, finish):
    visited = {start: 0}
    heap = []
    heappush(heap, (0, start, [start]))

    while heap:
        cost, node, path = heappop(heap)
        if node == finish:
            return cost, node, path

        for i, j in g[node]:
            if i not in visited or cost+j <= visited[i]:
                visited[i] = cost + j
                heappush(heap, (cost+j, i, path + [i]))

    return None, None, None

def dfs(graph, start, limit=float('inf'), visited=[]):
    if limit <= 0:
        return
    if start not in visited:
        print(start, end=', ')
        visited.append(start)
    for i in graph[start]:
        if i not in visited:
            dfs(graph, i, limit-1, visited)

def bfs(graph, start):
    visited = []
    queue = deque()
    queue.append(start)

    while (queue):
        node = queue.popleft()
        if node not in visited:
            print(node, end=', ')
            visited.append(node)

            for i in graph[node]:
                if i not in visited:
                    queue.append(i)

if __name__ == '__main__':
    # dfs(tree, 'a')
    # print()

    # bfs(tree, 'a')
    # print(dir(deque))

    print(ucs(G, 'Arad', 'Bucharest'))
