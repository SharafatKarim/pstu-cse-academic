#include <bits/stdc++.h>
using namespace std;

map<string, vector<string>> graph;

void addNode(string v) {
    if (graph[v].empty()) graph[v] = {};
}

void addEdge(string u, string v) {
    graph[u].push_back(v);
    if (graph[v].empty()) graph[v] = {};
}

void printAll() {
    for (auto it:graph) {
        cout << it.first << " -> ";
        for (auto it2: it.second) {
            cout <<it2 << " ";
        }
        cout << endl;
    }
}

void searchEdge(string u, string v) {
    for (auto it:graph) {
        if (it.first == u) {
            for (auto it2: it.second) {
                if (it2 == v) {
                    cout << it.first << " -> " << it2 << " ";
                }
            }
            cout << endl;
        }
    }
    cout << "Edge not found";
}

int main() {
    addEdge("A", "D");
    addEdge("A", "C");
    addEdge("A", "B");

    addEdge("B", "C");

    addEdge("D", "C");
    addEdge("D", "E");

    addEdge("E", "C");

    cout << "\nBefore: \n";
    printAll();

    cout << "\nAfter new node: \n";
    addNode("F");
    printAll();

    cout << "\nAfter new edge: \n";
    addEdge("F", "E");
    printAll();

    cout << "\nSearching an edge: \n";
    searchEdge("D", "C");
}
