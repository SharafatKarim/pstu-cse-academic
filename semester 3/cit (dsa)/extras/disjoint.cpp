#include <bits/stdc++.h>
using namespace std;

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

int main() {
  makeSet(1e6);
  unite(1024, 2048);
  unite(2048, 4096);
  cout << find(1024) << endl;
  cout << find(2048) << endl;
  cout << find(4096) << endl;
  return 0;
}