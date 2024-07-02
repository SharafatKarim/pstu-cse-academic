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
    void insertIntoLocation(Node *location, int item) {
        if (location == NULL) {
            insertFirst(item);
            return;
        }
        Node *new_node = new Node(item);
        new_node->link = location->link;
        location->link = new_node;
    }
    Node *findLastSmaller(int item) {
        Node *temp = start;
        Node *prev = NULL;
        while (temp != NULL) {
            if (temp->data < item) {
                prev = temp;
                temp = temp->link;
            } else {
                return prev;
            }
        }
        return prev;
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
    list.printAll();
    Node *location = list.findLastSmaller(15);
    list.insertIntoLocation(location, 15);
    list.printAll();
}