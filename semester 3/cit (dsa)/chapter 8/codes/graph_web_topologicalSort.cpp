#include<bits/stdc++.h>

using namespace std;

template<typename T> class Graph {
    map<T, list<T>> adjList;
public:
    Graph() {}
    void addEdge(T u, T v, bool bidir = false) {
        adjList[u].push_back(v);
        if (adjList.find(v) == adjList.end()) 
            adjList[v] = list<T>();
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

    void topologicalSort() {
        map<T, int> indegree;
        queue<T> q;
        stack<T> s_q_reversed;
        for(auto i : adjList) {
            indegree[i.first] = i.second.size();
            if (indegree[i.first] == 0) 
                q.push(i.first);
        }
        while(!q.empty()) {
            T node = q.front();
            s_q_reversed.push(node);
            // cout << node << " ";
            q.pop();
            for (auto i: adjList) {
                for(auto neighbour : i.second) {
                    if(neighbour == node) {
                        indegree[i.first]--;
                        if(indegree[i.first] == 0) 
                            q.push(i.first);
                        continue;
                    }
                }
            }
        }
        // cout << endl;
        while(!s_q_reversed.empty()) {
            cout << s_q_reversed.top() << " ";
            s_q_reversed.pop();
        }
    }
};

int main() {
    Graph<char> g;
    g.addEdge('A', 'C');
    g.addEdge('B', 'D');
    g.addEdge('B', 'F');
    g.addEdge('D', 'C');
    g.addEdge('E', 'C');
    g.addEdge('G', 'A');
    g.addEdge('G', 'F');

    g.print();

    cout << endl;
    g.topologicalSort();


    return 0;
}
