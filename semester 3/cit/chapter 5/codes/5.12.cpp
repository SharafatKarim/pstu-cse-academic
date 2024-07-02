#include <iostream>
using namespace std;

struct Node {
    int data;
    Node* link;
    Node(int data) {
        this->data = data;
        link = NULL;
    }
};

class HeaderLinkedList {
private:
    Node *start;
public:
    HeaderLinkedList() {
        start = NULL;
    }
    void insertAtBeginning(int data) {
        Node *new_node = new Node(data);
        if (start == NULL) {
            start = new Node(0);
            start->link = new_node;
            new_node->link = start;
            return;
        }
        new_node->link = start->link;
        start->link = new_node;
    }
    Node *search(int data) {
        if (start == NULL) {
            cout << "List is empty" << endl;
            return NULL;
        }
        Node *temp = start->link;
        while (temp != start) {
            if (temp->data == data) {
                return temp;
            }
            temp = temp->link;
        }
        cout << "Element not found" << endl;
        return NULL;
    }
    void listAll() {
        if (start == NULL) {
            cout << "List is empty" << endl;
            return;
        }
        Node *temp = start->link;
        while (temp != start) {
            cout << temp->data << " ";
            temp = temp->link;
        }
        cout << endl;
    }
};

int main() {
    HeaderLinkedList list;
    list.insertAtBeginning(10);
    list.insertAtBeginning(20);
    list.insertAtBeginning(50);
    list.insertAtBeginning(5);
    list.listAll();
    Node *searched = list.search(10);
    if (searched != NULL) {
        cout << "Element found: " << searched->data << endl;
    }
    return 0;
}