#include <bits/stdc++.h>
using namespace std;

map<int, vector<int>> graph;

void insertNode(int N) {
    if (graph[N].empty())
        graph[N] = {};
}

void deleteNode(int N) {
    graph[N] = {};
    graph.erase(N);
}

void addEdge(int u, int v) {
    graph[u].push_back(v);
}

void printGraph() {
    for (auto it:graph) {
        cout << it.first << " -> ";
        for (auto si:it.second)
            cout << si << " ";
        cout << endl;
    }
}

int main() {
    insertNode(1);
    insertNode(2);
    insertNode(3);

    addEdge(1, 3);
    deleteNode(2);

    printGraph();
}
