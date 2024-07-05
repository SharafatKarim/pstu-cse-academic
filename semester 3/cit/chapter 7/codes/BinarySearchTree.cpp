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

void find(Node *&root, Node *&location, Node *&previous, int item) {
    location = root;
    previous = NULL;
    if (location == NULL) {
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

void insert(Node *&root, int item) {
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

void preorder(Node *root) {
    if (root == NULL) return;
    cout << root -> data << " ";
    preorder(root -> left);
    preorder(root -> right);
}

void inorder(Node *root) {
    if (root == NULL) return;
    inorder(root -> left);
    cout << root -> data << " ";
    inorder(root -> right);
}

int main() {
    Node* tree = NULL;
    insert(tree, 25);
    insert(tree, 5);
    insert(tree, 50);
    insert(tree, 5);
    insert(tree, 45);

    cout << "Preorder -> \n";
    preorder(tree);
    cout << "\nInorder -> \n";
    inorder(tree);
}