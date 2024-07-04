#include <iostream>
#include <stack>
#include <queue>

using namespace std;

struct Node {
    int data;
    Node* left;
    Node* right;
    Node(int data) {
        this->data = data;
        left = NULL;
        right = NULL;
    }
};

void find(Node *root, Node *&location, Node *&previous, int item) {
    location = root;
    previous = NULL;
    if (root == NULL) {
        return;
    }
    while (location != NULL) {
        if (item == location -> data) {
            return;
        } 
        if (item < location -> data) {
            previous = location;
            location = location -> left;
        }
        else {
            previous = location;
            location = location -> right;
        }
    }
}

void insert(Node *root, int item) {
    Node *location, *previous;
    find(root, location, previous, item);
    if (location != NULL) return;
    if (previous == NULL)
        root = new Node(item);
    else if (item < previous -> data) 
        previous -> left = new Node(item);
    else 
        previous -> right = new Node(item);
}

int main() {
    Node* tree = NULL;
    insert(tree, 5);
    insert(tree, 50);
}