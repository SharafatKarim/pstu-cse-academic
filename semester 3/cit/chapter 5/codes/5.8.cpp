#include <iostream>
using namespace std;

struct Node {
    int data;
    Node* next;
    Node(int data) {
        this->data = data;
        next = NULL;
    }
};

class LinkedList {
private:
    Node *head;
public:
    LinkedList() {
        head = NULL;
    }
    void insertFirst(int data) {
        Node *new_node = new Node(data);
        new_node->next = head;
        head = new_node;
    }
    void deleteAtLocation(Node* location, Node* prev_location) {
        if (prev_location == NULL) {
            head = head->next;
        }
        prev_location->next = location->next;
        delete location;
    }
    void printAll() {
        if (head == NULL) {
            cout << "List is empty!\n";
            return;
        }
        Node *temp = head;
        while (temp != NULL) {
            cout << temp->data << " ";
            temp = temp->next;
        }
        cout << endl;
    }
};

int main() {
    LinkedList list;
    list.insertFirst(20);
    list.insertFirst(10);
    list.printAll();
}