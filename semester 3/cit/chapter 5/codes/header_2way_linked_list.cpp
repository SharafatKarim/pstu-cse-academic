#include <iostream>
using namespace std;

struct Node {
    int data;
    Node* next;
    Node* prev;
};

class Header2WayLinkedList {
    Node* head;
    Node* tail;
    int size;
public:
    Header2WayLinkedList() {
        head = new Node();
        tail = new Node();
        head->next = tail;
        tail->prev = head;
        size = 0;
    }

    void insertBefore(int data) {
        Node* newNode = new Node();
        newNode->data = data;
        newNode->next = head->next;
        newNode->prev = head;
        head->next->prev = newNode;
        head->next = newNode;
        size++;
    }

    void insertInBetween(int item, Node *prev, Node *next) {
        Node* newNode = new Node();
        newNode->data = item;
        newNode->next = next;
        newNode->prev = prev;
        prev->next = newNode;
        next->prev = newNode;
        size++;
    }

    void getLocationAndPrev(int data, Node* &location, Node* &prev) {
        location = head->next;
        prev = head;
        while (location != tail) {
            if (location->data == data) {
                return;
            }
            prev = location;
            location = location->next;
        }
        location = NULL;
    }        

    void deleteAtPostion(Node *current) {
        current->prev->next = current->next;
        current->next->prev = current->prev;
        delete current;
        size--;
    }

    void remove(int data) {
        Node* current = head->next;
        while (current != tail) {
            if (current->data == data) {
                deleteAtPostion(current);
                return;
            }
            current = current->next;
        }
    }

    void print() {
        Node* current = head->next;
        while (current != tail) {
            cout << current->data << " ";
            current = current->next;
        }
        cout << endl;
    }

    int getSize() {
        return size;
    }
};

int main() {
    Header2WayLinkedList list;
    list.insertBefore(1);
    list.insertBefore(2);
    list.insertBefore(3);
    list.insertBefore(4);
    list.insertBefore(5);
    list.print();

    list.remove(4);
    list.print();
    
    Node *location, *prev;
    list.getLocationAndPrev(3, location, prev);
    if (location == NULL) {
        cout << "Not found" << endl;
    } else {
        list.insertInBetween(4, prev, location);
    }
    list.print();

    return 0;
}