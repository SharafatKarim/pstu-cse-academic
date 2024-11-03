#include <bits/stdc++.h>
using namespace std;

map<int, vector<pair<int, int>>> graph;

void insertIntoGraph(int u, int v, int w) {
    graph[u].push_back({v, w});
    if (graph[v].empty()) graph[v] = {};
}

void printGraph() {
    for (auto u: graph) {
        cout << u.first << ": ";
        for (auto v: u.second) {
            cout << "(" << v.first << ",   " << v.second << ") ";
        }
        cout << endl;
    }
}

void bellmanFord(int src) {
    int V = graph.size();
    vector<int> dist(V, INT_MAX);
    dist[src] = 0;

    for (int i=0; i<V; i++) {
        for (auto u: graph) {
            for (auto v: u.second) {
                int from = u.first;
                int to = v.first;
                int weight = v.second;
                if (dist[from] != INT_MAX && dist[from] + weight < dist[to]) {
                    dist[to] = dist[from] + weight;
                }
            }
        }
    }

    for (auto u: graph) {
        for (auto v: u.second) {
            int from = u.first;
            int to = v.first;
            int weight = v.second;
            if (dist[from] != INT_MAX && dist[from] + weight < dist[to]) {
                cout << "Negative cycle found" << endl;
                return;
            }
        }
    }

    cout << "Vertex Distance from Source" << endl;
    for (int i=0; i<V; i++) {
        cout << i << "    " << dist[i] << endl;
    }
}

int main() {
    insertIntoGraph(0, 1, -1);
    insertIntoGraph(0, 2, 4);
    insertIntoGraph(1, 2, 3);
    insertIntoGraph(1, 3, 2);
    insertIntoGraph(1, 4, 2);
    insertIntoGraph(3, 2, 5);
    insertIntoGraph(3, 1, 1);
    insertIntoGraph(4, 3, -3);

    // printGraph();
    bellmanFord(0);
}
