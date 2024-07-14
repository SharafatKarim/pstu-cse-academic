#include <iostream>

using namespace std;

template<typename T> class Node {
public:
    T data;
    Node* next_link;
    Node* adjacents;
    
    Node(T data) {
        this->data = data;
        next_link = nullptr;
        adjacents = nullptr;
    }
};

class Graph {
    Node<int>* start;
public:
    Graph() {start = nullptr;}
    
    void insertNode(int data) {
        Node<int>* new_node = new Node<int>(data);
        if (start == nullptr) {
            start = new_node;
        } else {
            new_node->next_link = start;
            start = new_node;
        }
    }
    
    void test() {
        if (start == nullptr) cout << "hi";
    }
};

int main() {
    Graph g;
    g.test();
    return 0;
}