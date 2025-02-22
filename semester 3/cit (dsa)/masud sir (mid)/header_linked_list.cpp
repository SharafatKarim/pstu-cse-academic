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
    
    void findLocationAndPrev(int item, Node **prev_location, Node **location) {
        *prev_location = start;
        Node *temp = start->link;
        while (temp != start) {
            if (temp->data == item) {
                *location = temp;
                return;
            }
            *prev_location = temp;
            temp = temp->link;
        }
        *location = NULL;
    }
    void deleteAtLocation(int item) {
        Node *prev_location, *location;
        findLocationAndPrev(item, &prev_location, &location);
        if (location == NULL) {
            cout << "Element not found" << endl;
            return;
        }
        prev_location->link = location->link;
        delete location;
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
        cout <<start->link->data;
        cout << endl;
    }
};

int main() {
    HeaderLinkedList list;
    // list.insertAtBeginning(10);
    // list.insertAtBeginning(20);
    // list.insertAtBeginning(50);
    // list.insertAtBeginning(5);

    int in;
    do {
        cin >> in;
        if (in != -1) list.insertAtBeginning(in);
    }while (in != -1);

    list.listAll();
    list.deleteAtLocation(50);
    list.listAll();
    return 0;
}
