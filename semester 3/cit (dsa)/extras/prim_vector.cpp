#include<bits/stdc++.h>
using namespace std;

vector<vector<int>> graph;
int V = 5;
void printMST(vector<int> &parent);

int minimum(vector<int> &key, vector<bool> &visited) {
  int minimum = INT_MAX, min_index;
  for (int i=0; i<V; i++) {
    if (visited[i] == false && key[i] < minimum) {
      minimum = key[i];
      min_index = i;
    }
  }
  return min_index;
}

void prim() {
  vector<int> key(V, INT_MAX);
  vector<bool> visited(V, false);
  vector<int> parent(V);

  key[0] = 0;
  parent[0] = -1;

  for (int i=0; i < V-1; i++) {
    int u = minimum(key, visited);
    visited[u] = true;

    for (int v=0; v<V; v++) {
      if (graph[u][v] && visited[v] == false && graph[u][v] < key[v]) {
        parent[v] = u;
        key[v] = graph[u][v];
      }
    }
  }

  printMST(parent);
}

void printMST(vector<int> &parent) {
  cout << "Edge \tWeight\n";
  for (int i=1; i<V; i++) {
    cout << parent[i] << " - " << i << " \t" << graph[i][parent[i]] << endl;
  }
}



int main() {
  graph = { { 0, 2, 0, 6, 0 },
            { 2, 0, 3, 8, 5 },
            { 0, 3, 0, 0, 7 },
            { 6, 8, 0, 0, 9 },
            { 0, 5, 7, 9, 0 } };
  prim();
}