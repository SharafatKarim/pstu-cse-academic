#include<bits/stdc++.h>

using namespace std;

template<typename T> class Graph {
    map<T, list<T>> adjList;
public:
    Graph() {}
    void addEdge(T u, T v, bool bidir = false) {
        adjList[u].push_back(v);
        if(bidir) adjList[v].push_back(u);
    }
    void print() {
        for(auto i : adjList) {
            cout << i.first << " -> ";
            for(auto entry : i.second) {
                cout << entry << ", ";
            }
            cout << endl;
        }
    }
    void bfs(T src) {
        queue<T> q;
        map<T, bool> visited;
        q.push(src);
        visited[src] = true;
        while(!q.empty()) {
            T node = q.front();
            cout << node << " ";
            q.pop();
            for(auto neighbour : adjList[node]) {
                if(!visited[neighbour]) {
                    q.push(neighbour);
                    visited[neighbour] = true;
                }
            }
        }
    }
    void sssp(T src) {
        queue<T> q;
        map<T, int> dist;
        // map<T, T> parent;
        for(auto i : adjList) {
            dist[i.first] = INT_MAX;
        }
        q.push(src);
        dist[src] = 0;
        // parent[src] = src;
        while(!q.empty()) {
            T node = q.front();
            q.pop();
            for(auto neighbour : adjList[node]) {
                if(dist[neighbour] == INT_MAX) {
                    q.push(neighbour);
                    dist[neighbour] = dist[node] + 1;
                    // parent[neighbour] = node;
                }
            }
        }
        for(auto i : adjList) {
            T node = i.first;
            cout << "Distance of " << node << " from " << src << " is " << dist[node] << endl;
        }
    }
    void dfsHelper(T node, map<T, bool> &visited) {
        visited[node] = true;
        cout << node << " ";
        for(auto neighbour : adjList[node]) {
            if(!visited[neighbour]) {
                dfsHelper(neighbour, visited);
            }
        }
    }
    // void dfs(T src) {
    //     map<T, bool> visited;
    //     dfsHelper(src, visited);
    // }
    void dfs(T src) {
        stack<T> s;
        map<T, bool> visited;
        s.push(src);
        visited[src] = true;
        while(!s.empty()) {
            T node = s.top();
            cout << node << " ";
            s.pop();
            for(auto neighbour : adjList[node]) {
                if(!visited[neighbour]) {
                    s.push(neighbour);
                    visited[neighbour] = true;
                }
            }
        }
    }
};

int main() {
    Graph<char> g;
    g.addEdge('A', 'F');
    g.addEdge('A', 'C');
    g.addEdge('A', 'B');
    g.addEdge('B', 'G');
    g.addEdge('B', 'C');
    g.addEdge('C', 'F');
    g.addEdge('D', 'C');
    g.addEdge('E', 'D');
    g.addEdge('E', 'C');
    g.addEdge('E', 'J');
    g.addEdge('F', 'D');
    g.addEdge('G', 'C');
    g.addEdge('G', 'E');
    g.addEdge('J', 'D');
    g.addEdge('J', 'K');
    g.addEdge('K', 'E');
    g.addEdge('K', 'G');

    g.print();
    g.bfs('A');

    cout << endl;
    g.dfs('J');

    cout << endl;
    g.sssp('A');

    return 0;
}
