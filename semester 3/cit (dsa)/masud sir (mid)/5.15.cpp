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
    list.remove(3);
    list.print();
    return 0;
}