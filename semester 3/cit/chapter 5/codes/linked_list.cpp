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
    void insertIntoSorted(int item) {
        if (start == NULL || start->data >= item) {
            insertFirst(item);
            return;
        }
        Node *location = findLastSmaller(item);
        if (location == NULL) {
            insertLast(item);
            return;
        }
        insertIntoLocation(location, item);
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
    Node *search(int item) {
        if (start == NULL) {
            cout << "List is empty!\n";
            return NULL;
        }
        Node *temp = start;
        while (temp != NULL) {
            if (temp->data == item) {
                return temp;
            }
            temp = temp->link;
        }
        return NULL;
    }
    Node *searchSorted(int item) {
        if (start == NULL) {
            cout << "List is empty!\n";
            return NULL;
        }
        Node *temp = start;
        while (temp != NULL) {
            if (temp->data < item)
                temp = temp->link;
            else if (temp->data == item) 
                return temp;
            else 
                return NULL;
        }
    }
};

int main() {
    LinkedList list;
    list.insertFirst(20);
    list.insertFirst(10);
    list.printAll();
    // Node *found_1 = list.search(10);
    // if (found_1 != NULL) {
    //     cout << "Found: " << found_1->data << endl;
    // } else {
    //     cout << "Not found!\n";
    // }
    Node *found_2 = list.searchSorted(10);
    if (found_2 != NULL) {
        cout << "Found: " << found_2->data << endl;
    } else {
        cout << "Not found!\n";
    }
    list.insertIntoSorted(25);
    list.printAll();
}