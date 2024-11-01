#include<bits/stdc++.h>
using namespace std;

vector<vector<int>> graph;
int V = 5;

int minimum(vector<int> &key, vector<bool> &visited) {
  int minimum = INT_MAX, min_index;
  for (int i=0; i<v; i++) {
    if (visited[i] == false)
  }
}

void prim() {
  vector<int> key(V, INT_MAX);
  vector<bool> visited(V, false);
  vector<int> parent(V);
}

int main() {
  graph = { { 0, 2, 0, 6, 0 },
            { 2, 0, 3, 8, 5 },
            { 0, 3, 0, 0, 7 },
            { 6, 8, 0, 0, 9 },
            { 0, 5, 7, 9, 0 } };
}