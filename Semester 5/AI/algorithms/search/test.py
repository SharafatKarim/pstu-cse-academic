from heapq import heappush, heappop

def romania_graph():
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
    h = {
        "Arad": 366, "Bucharest": 0, "Craiova": 160, "Drobeta": 242, "Eforie": 161,
        "Fagaras": 176, "Giurgiu": 77, "Hirsova": 151, "Iasi": 226, "Lugoj": 244,
        "Mehadia": 241, "Neamt": 234, "Oradea": 380, "Pitesti": 100,
        "Rimnicu Vilcea": 193, "Sibiu": 253, "Timisoara": 329, "Urziceni": 80,
        "Vaslui": 199, "Zerind": 374,
    }
    return G, h

# --- Tiny A* implementation for testing ---
def astar(G, h, start, goal):
    frontier = []
    heappush(frontier, (h[start], 0, start, [start]))  # (f=g+h, g, node, path)
    best_g = {start: 0}

    while frontier:
        f, g, node, path = heappop(frontier)
        if node == goal:
            return path, g  # path and total cost
        for nbr, w in G[node]:
            g2 = g + w
            if nbr not in best_g or g2 < best_g[nbr]:
                best_g[nbr] = g2
                heappush(frontier, (g2 + h[nbr], g2, nbr, path + [nbr]))
    return None, float("inf")

if __name__ == "__main__":
    G, h = romania_graph()
    path, cost = astar(G, h, "Arad", "Bucharest")
    print("Path:", " → ".join(path))
    print("Total distance:", cost, "km")
