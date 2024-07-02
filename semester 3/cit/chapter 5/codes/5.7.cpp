// It has a limitation. While inserting into a sorted list, if the item is greater than all the elements in the list, it will not insert the item at the end of the list. It will insert the item at the beginning of the list. So, we need to modify the code to handle this case.

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
    Node *location = list.findLastSmaller(15);
    list.insertIntoLocation(location, 25);
    list.printAll();
}