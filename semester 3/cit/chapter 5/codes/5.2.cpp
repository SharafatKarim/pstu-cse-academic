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
};

int main() {
    LinkedList list;
    list.search(5);
}