#include <iostream>
#include <vector>

using namespace std;

class Node {
public:
    int data;
    Node* next_link; 
    Node* adjacent;
    Node* destination;

    Node (int data) {
        this->data = data;
        this->next_link = nullptr;
        this->adjacent = nullptr;
        this->destination = nullptr;
    }
    Node (Node* destination) {
        this->data = 0;
        this->next_link = nullptr;
        this->adjacent = nullptr;
        this->destination = destination;
    }
};

class Graph {
    Node* start; 
public:
    Graph() : start(nullptr) {}
    
    Node* find(int data) {
        Node* temp = start;
        while (temp != nullptr) {
            if (temp->data == data) return temp;
            temp = temp->next_link;
        }
        return nullptr;
    }

    void insertNode(int data) {
        Node* new_node = new Node(data);
        if (start == nullptr) {
            start = new_node;
        } else {
            new_node->next_link = start;
            start = new_node;
        }
    }

    void insertEdge(int data1, int data2) {
        Node* node1 = find(data1);
        Node* node2 = find(data2);
        if (node1 == nullptr || node2 == nullptr) {
            cout << "Node not found" << endl;
            return;
        }
        Node* new_node = new Node(node2);
        new_node->next_link = node1->adjacent;
        node1->adjacent = new_node;
    }
    
    void test() {
        if (start == nullptr) cout << "Graph is empty" << endl;
        else cout << "Graph is not empty" << endl;
    }

    void printAll() {
        Node* temp = start;
        while (temp != nullptr) {
            cout << temp->data << ": ";
            for (auto adj : temp->adjacents) {
                cout << adj->data << " ";
            }
            cout << endl;
            temp = temp->next_link;
        }
    }
};

int main() {
    Graph g;
    g.insertNode(1);
    g.insertNode(2);
    g.insertEdge(1, 2);
    g.test();
    g.printAll();
    return 0;
}