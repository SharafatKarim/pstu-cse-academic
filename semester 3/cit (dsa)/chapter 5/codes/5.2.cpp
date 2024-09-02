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
};

int main() {
    LinkedList list;
    list.search(5);
}