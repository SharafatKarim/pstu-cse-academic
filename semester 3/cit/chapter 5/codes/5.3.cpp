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
    Node *search(int item) {
        if (head == NULL) {
            cout << "List is empty!\n";
            return NULL;
        }
        Node *temp = head;
        while (temp != NULL) {
            if (temp->data == item) {
                return temp;
            }
            temp = temp->next;
        }
        return NULL;
    }
    Node *searchSorted(int item) {
        if (head == NULL) {
            cout << "List is empty!\n";
            return NULL;
        }
        Node *temp = head;
        while (temp != NULL) {
            if (temp->data < item)
                temp = temp->next;
            else if (temp->data == item) 
                return temp;
            else 
                return NULL;
        }
    }
};

int main() {
    LinkedList list;
    list.insertFirst(10);
    list.insertFirst(20);
    list.printAll();
    Node *found_1 = list.search(10);
    if (found_1 != NULL) {
        cout << "Found: " << found_1->data << endl;
    } else {
        cout << "Not found!\n";
    }
    Node *found_2 = list.searchSorted(10);
    if (found_2 != NULL) {
        cout << "Found: " << found_2->data << endl;
    } else {
        cout << "Not found!\n";
    }
}