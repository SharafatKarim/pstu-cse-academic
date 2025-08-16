# Unidriected Tree
un_tree = {
        'A': ['B', 'E'],
        'B': ['C', 'D', 'A'],
        'C': ['F', 'B'],
        'D': ['B'],
        'E': ['A'],
        'F': ['C']
    }


from collections import deque
def bidirectional(tree, start, goal):
    if start == goal:
        return None, None

    start_visited = []
    goal_visited = []

    start_queue = deque([start])
    goal_queue = deque([goal])

    while start_queue and goal_queue:
        start_node = start_queue.popleft()
        if start_node not in start_visited:
            start_visited.append(start_node)

            for neighbour in tree[start_node]:
                if neighbour not in start_visited:
                    start_queue.append(neighbour)

        goal_node = goal_queue.popleft()
        if goal_node not in goal_visited:
            goal_visited.append(goal_node)

            for neighbour in tree[goal_node]:
                if neighbour not in goal_visited:
                    goal_queue.append(neighbour)

        if start_node in goal_visited or goal_node in start_visited:
            return start_visited, goal_visited

print(bidirectional(un_tree, 'A', 'F'))
