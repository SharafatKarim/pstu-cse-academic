#include <bits/stdc++.h>
using namespace std;

int V = 7;
vector<vector<pair<int, int>>> graph(V);
vector<vector<int>> adjMatrix(V, vector<int>(V, 0));

void addEdge(int u, int v, int w) {
  graph[u].push_back({v, w});
  graph[v].push_back({u, w});
}

void path_to_adjMatrix() {
  for (int i = 0; i < V; i++) {
    for (int j = 0; j < graph[i].size(); j++) {
      adjMatrix[i][graph[i][j].first] = graph[i][j].second;
    }
  }
}

void printAdjMatrix() {
  for (int i = 1; i < V; i++) {
    for (int j = 1; j < V; j++) {
      cout << adjMatrix[i][j] << " ";
    }
    cout << endl;
  }
}

int main() {
  addEdge(1, 6, 1);
  addEdge(2, 1, 1);
  addEdge(2, 3, 1);
  addEdge(3, 5, 1);
  addEdge(4, 5, 1);
  addEdge(4, 2, 1);
  addEdge(2, 6, 1);
  addEdge(5, 3, 1);
  addEdge(4, 3, 1);
  addEdge(6, 4, 1);

  path_to_adjMatrix();
  printAdjMatrix();
  return 0;
}