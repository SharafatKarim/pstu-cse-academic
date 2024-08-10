#include <iostream>

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

    Node* findEdge(int data1, int data2) {
        Node* node1 = find(data1);
        Node* node2 = find(data2);
        if (node1 == NULL || node2 == NULL) {
            cout << "Node not found" << endl;
            return NULL;
        }
        Node* temp = node1->adjacent;
        while (temp != NULL) {
            if (temp->destination == node2) return temp;
            temp = temp->next_link;
        }
        cout << "Edge not found" << endl;
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

    void deleteNodeOnly(int data) {
        Node* temp = start;
        if (temp->data == data) {
            start = temp->next_link;
            delete temp;
            return;
        }
        Node* save = temp;
        temp = temp->next_link;
        while (temp != NULL) {
            if (temp->data == data) {
                save->next_link = temp->next_link;
                delete temp;
                return;
            }
            save = temp;
            temp = temp->next_link;
        }
        cout << "Node not found" << endl;
    }

    void deleteNode(int data) {
        Node* node = find(data);
        if (node == NULL) {
            cout << "Node not found" << endl;
            return;
        }
        Node* temp = start;
        while (temp != NULL) {
            Node* temp2 = temp->adjacent;
            if (temp2 != NULL) {
                if (temp2->destination == node) {
                    temp->adjacent = temp2->next_link;
                    delete temp2;
                } else if (temp2 != NULL) {
                    Node* save = temp2;
                    temp2 = temp2->next_link;
                    while (temp2 != NULL) {
                        if (temp2->destination == node) {
                            save->next_link = temp2->next_link;
                            delete temp2;
                            break;
                        }
                        save = temp2;
                        temp2 = temp2->next_link;
                    }
                }
            }
            temp = temp->next_link;
        }
        deleteNodeOnly(data);
    }

    void deleteEdge(int data1, int data2) {
        Node* node1 = find(data1);
        Node* node2 = find(data2);
        if (node1 == NULL || node2 == NULL) {
            cout << "Node not found" << endl;
            return;
        }
        Node* temp = node1->adjacent;
        if (temp->destination == node2) {
            node1->adjacent = temp->next_link;
            delete temp;
            return;
        }
        Node* save = temp;
        temp = temp->next_link;
        while (temp != NULL) {
            if (temp->destination == node2) {
                save->next_link = temp->next_link;
                delete temp;
                return;
            }
            save = temp;
            temp = temp->next_link;
        }
        cout << "Edge not found" << endl;
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
};

int main() {
    Graph g;
    g.insertNode(2);
    g.insertNode(1);
    g.insertNode(3);

    g.insertEdge(1, 2);
    g.insertEdge(1, 2); // Edge already exists
    g.insertEdge(2, 3);
    g.insertEdge(3, 2);
    g.insertEdge(2, 1);

    g.deleteNode(1);
    g.deleteEdge(2, 3);

    g.printAll();
    
    // Node* n = g.find(2);
    // cout << "Found: " << n->data << endl;

    // Node* e = g.findEdge(2, 1);
    // cout << e->destination->data << endl;

    return 0;
}