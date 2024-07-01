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
    list.printAll();
}