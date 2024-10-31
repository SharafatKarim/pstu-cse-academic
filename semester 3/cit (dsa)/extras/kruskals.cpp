#include <bits/stdc++.h>
using namespace std;

vector<pair<int, pair<int, int>>> edges;
int parent[INT_MAX];

void makeSet(int n) {
  for (int i = 0; i <= n; i++)
    parent[i] = i;
}

int find(int n) {
  if (parent[n] == n) return n;
  int result = find(parent[n]);
  parent[n] = result;
  return result;
}

void unite(int i, int j) {
  parent[find(i)] = find(j);
}

void addEdges(int i, int j, int k) {
  edges.push_back({k, {i, j}});
}

void kruskal() {
  sort(edges.begin(), edges.end());
  int weight = 0;
  for (auto it: edges) {
    int i = it.second.first;
    int j = it.second.second;
    int k = it.first;
    if (find(i) != find(j)) {
      unite(i, j);
      cout << i << " " << j << " " << k << endl;
      weight += k;
    }
  }
  cout << "Weight: " << weight << endl;
}

int main() {
  makeSet(1e6);
  
  addEdges(0, 1, 10);
  addEdges(1, 3, 15);
  addEdges(2, 3, 4);
  addEdges(2, 0, 6);
  addEdges(0, 3, 5);
  kruskal();

  return 0;
}

