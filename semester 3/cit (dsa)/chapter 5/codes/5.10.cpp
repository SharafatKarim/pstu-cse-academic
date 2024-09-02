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

class LinkedList {
private:
    Node *start;
public:
    LinkedList() {
        start = NULL;
    }
    void insertFirst(int data) {
        Node *new_node = new Node(data);
        new_node->link = start;
        start = new_node;
    }
    void insertLast(int data) {
        if (start == NULL) {
            insertFirst(data);
            return;
        }
        Node *temp = start;
        while (temp->link != NULL) {
            temp = temp->link;
        }
        Node *new_node = new Node(data);
        temp->link = new_node;
    }

    void deleteAtLocation(Node *location, Node *prev_location) {
        if (prev_location == NULL) {
            start = start->link;
        } else {
            prev_location->link = location->link;
        }
        delete location;
    }
    void findLocationAndPrev(int item, Node *&location, Node *&prev) {
        prev = NULL;
        location = start;
        while (location != NULL) {
            if (location->data == item) {
                return;
            } else {
                prev = location;
                location = location->link;
            }
        }
        location = NULL;
        return;
    }
    void deleteItem(int item) {
        Node *location, *prev;
        findLocationAndPrev(item, location, prev);
        if (location == NULL) {
            cout << "Item not found!\n";
            return;
        }
        deleteAtLocation(location, prev);
    }

    void printAll() {
        if (start == NULL) {
            cout << "List is empty!\n";
            return;
        }
        Node *temp = start;
        while (temp != NULL) {
            cout << temp->data << " ";
            temp = temp->link;
        }
        cout << endl;
    }
};

int main() {
    LinkedList list;
    list.insertFirst(20);
    list.insertFirst(10);
    list.insertFirst(30);
    list.printAll();

    list.deleteItem(30);
    list.printAll();
}