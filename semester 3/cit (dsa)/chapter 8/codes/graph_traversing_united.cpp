#include <iostream>
#include <queue>
#include <stack>
#include <map>

using namespace std;

class Node {
public:
    int data;
    Node* next_link; 
    Node* adjacent;
    Node* destination;

    Node (int data) {
        this->data = data;
        this->next_link = NULL;
        this->adjacent = NULL;
        this->destination = NULL;
    }
    Node (Node* destination) {
        this->data = 0;
        this->next_link = NULL;
        this->adjacent = NULL;
        this->destination = destination;
    }
};

class Graph {
    Node* start; 
public:
    Graph() : start(NULL) {}
    
    Node* find(int data) {
        Node* temp = start;
        while (temp != NULL) {
            if (temp->data == data) return temp;
            temp = temp->next_link;
        }
        return NULL;
    }

    void insertNode(int data) {
        Node* new_node = new Node(data);
        if (find(data) != NULL) {
            cout << "Node already exists" << endl;
            return;
        }
        if (start == NULL) {
            start = new_node;
        } else {
            new_node->next_link = start;
            start = new_node;
        }
    }

    void insertEdge(int data1, int data2) {
        Node* node1 = find(data1);
        Node* node2 = find(data2);
        if (node1 == NULL || node2 == NULL) {
            cout << "Node not found" << endl;
            return;
        }
        
        Node* temp = node1->adjacent;
        while (temp != NULL)
        {
            if (temp->destination == node2) {
                cout << "Edge already exists" << endl;
                return;
            }
            temp = temp->next_link;
        }

        Node* new_node = new Node(node2);
        new_node->next_link = node1->adjacent;
        node1->adjacent = new_node;
    }

    void printAll() {
        Node* temp = start;
        while (temp != NULL) {
            cout << temp->data << " -> ";
            Node* temp2 = temp->adjacent;
            while (temp2 != NULL) {
                cout << temp2->destination->data << ", ";
                temp2 = temp2->next_link;
            }
            temp = temp->next_link;
            cout << endl;
        }
    }

    void breadthFirst() {
        queue<Node*> q;
        q.push(start);
        map<Node*, bool> visited;
        visited[start] = true;

        while (!q.empty()) {
            Node* temp = q.front();
            cout << temp->data << " ";
            q.pop();
            temp = temp->adjacent;
            while (temp != NULL) {
                if (!visited[temp->destination]) {
                    q.push(temp->destination);
                    visited[temp->destination] = true;
                }
                temp = temp->next_link;
            }
        }
        cout << endl;
    }
    
    void depthFirst() {
        stack<Node*> s;
        s.push(start);
        map<Node*, bool> visited;
        visited[start] = true;

        while (!s.empty()) {
            Node* temp = s.top();
            cout << temp->data << " ";
            s.pop();
            temp = temp->adjacent;
            while (temp != NULL) {
                if (!visited[temp->destination]) {
                    s.push(temp->destination);
                    visited[temp->destination] = true;
                }
                temp = temp->next_link;
            }
        }
        cout << endl;
    }
};

int main() {
    Graph g;
    g.insertNode(1);
    g.insertNode(2);
    g.insertNode(3);

    g.insertEdge(1, 2);
    g.insertEdge(2, 3);
    g.insertEdge(3, 2);
    g.insertEdge(2, 1);

    g.printAll();

    g.breadthFirst();
    g.depthFirst();

    return 0;
}