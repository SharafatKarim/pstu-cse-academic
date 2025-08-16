from heapq import heappush, heappop

# Undirected weighted graph: city -> list of (neighbor, distance_km)
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

# Straight-line distances to Bucharest (AIMA heuristic)
H = {
    "Arad": 366, "Bucharest": 0, "Craiova": 160, "Drobeta": 242, "Eforie": 161,
    "Fagaras": 176, "Giurgiu": 77, "Hirsova": 151, "Iasi": 226, "Lugoj": 244,
    "Mehadia": 241, "Neamt": 234, "Oradea": 380, "Pitesti": 100,
    "Rimnicu Vilcea": 193, "Sibiu": 253, "Timisoara": 329, "Urziceni": 80,
    "Vaslui": 199, "Zerind": 374,
}

def ucs(graph, start, goal):
    frontier = []
    heappush(frontier, (0, start, [start])) # path_cost, node, [path]
    best_graph = {start: 0}

    while frontier:
        path_cost, node, path_list = heappop(frontier)
        if node == goal:
            return path_cost, path_list
        for neighbor, neighbor_cost in graph[node]:
            updated_cost = path_cost + neighbor_cost
            if neighbor not in best_graph or updated_cost < best_graph[neighbor]:
                best_graph[neighbor] = updated_cost
                heappush(frontier, (updated_cost, neighbor, path_list + [neighbor]))

    return None, float("inf")

def greedy_best_first(graph, heuristic, start, goal):
    frontier = []
    heappush(frontier, (heuristic[start], 0, start, [start]))
    best_graph = {start: 0}

    while frontier:
        cost, path_cost, node, path_list = heappop(frontier)
        if node == goal:
            return path_cost, path_list
        for neighbor, neighbor_cost in graph[node]:
            updated_cost = cost + heuristic[neighbor]
            if neighbor not in best_graph or updated_cost < best_graph[neighbor]:
                best_graph[neighbor] = updated_cost
                heappush(frontier, (updated_cost, path_cost + neighbor_cost, neighbor, path_list + [neighbor]))

def a_star(graph, heuristic, start, goal):
    frontier = []
    heappush(frontier, (heuristic[start], 0, start, [start]))
    best_graph = {start: 0}

    while frontier:
        cost, path_cost, node, path_list = heappop(frontier)
        if node == goal:
            return path_cost, path_list
        for neighbor, neighbor_cost in graph[node]:
            updated_cost = path_cost + neighbor_cost + heuristic[neighbor]
            if neighbor not in best_graph or updated_cost < best_graph[neighbor]:
                best_graph[neighbor] = updated_cost
                heappush(frontier, (updated_cost, path_cost + neighbor_cost, neighbor, path_list + [neighbor]))

cost, path= a_star(G, H, "Arad", "Bucharest")
print("Path : ", " -> ".join(path))
print("Cost : ", cost)
