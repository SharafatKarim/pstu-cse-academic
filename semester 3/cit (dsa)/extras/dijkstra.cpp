#include <bits/stdc++.h>

using namespace std;

int V = 7;
vector<vector<pair<int, int>>> graph(V);

void addEdge(int u, int v, int w) {
  graph[u].push_back({v, w});
  graph[v].push_back({u, w});
}

void dijkstra(int src) {
  priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> pq;
  pq.push({0, src});

  vector<int> distance(V, INT16_MAX);
  distance[src] = 0;

  while (!pq.empty()) {
    auto p = pq.top();
    pq.pop();

    int u = p.second;
    int w = p.first;

    for (auto i = graph[u].begin(); i != graph[u].end(); i++) {
      int v = i->first;
      int wt = i->second;
      if (distance[u] + wt < distance[v]) {
        distance[v] = distance[u] + wt;
        pq.push({distance[v], v});
      }
    }
  }

  for (int i = 0; i < V; i++) {
    cout << "Distance from " << src << " to " << i << " is " << distance[i] << endl;
  }
}

int main() {
  addEdge(0, 1, 2);
  addEdge(0, 2, 6);
  addEdge(1, 3, 5);
  addEdge(2, 3, 8);
  addEdge(3, 4, 10);
  addEdge(3, 5, 15);
  addEdge(4, 6, 2);
  addEdge(5, 6, 6);

  dijkstra(0);
  return 0;
}