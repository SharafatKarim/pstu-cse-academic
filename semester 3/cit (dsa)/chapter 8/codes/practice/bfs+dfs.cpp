#include <bits/stdc++.h>
#include <queue>
using namespace std;

map<string, vector<string>> graph;

void addEdge(string u, string v) {
    graph[u].push_back(v);
}

void bfs(string src) {
    queue<string> q;
    map<string, int> visited;
    q.push(src);

    while (!q.empty()) {
        string u = q.front();
        q.pop();
        visited[u] = 2;
        cout << u << " ";

        for (string v : graph[u]) {
            if (visited[v] <= 0) {
              q.push(v);
              visited[v] = 1;
            }
        }
    }
}

void dfs(string src) {
    stack<string> s;
    map<string, int> visited;
    s.push(src);

    while (!s.empty()) {
        string u = s.top();
        s.pop();
        visited[u] = 2;
        cout << u << " ";

        for (string v : graph[u]) {
            if (visited[v] <= 0) {
              s.push(v);
              visited[v] = 1;
            }
        }
    }
}

int main() {
    addEdge("A", "F");
    addEdge("A", "C");
    addEdge("A", "B");
    addEdge("F", "D");
    addEdge("C", "F");
    addEdge("B", "C");
    addEdge("D", "C");
    addEdge("E", "C");
    addEdge("G", "C");
    addEdge("B", "G");
    addEdge("E", "D");
    addEdge("G", "E");
    addEdge("J", "D");
    addEdge("J", "K");
    addEdge("K", "E");
    addEdge("G", "E");
    addEdge("K", "G");
    addEdge("E", "J");

    cout << "BFS: ";
    bfs("A");
    cout << endl;
    cout << "DFS: ";
    dfs("A");
}
