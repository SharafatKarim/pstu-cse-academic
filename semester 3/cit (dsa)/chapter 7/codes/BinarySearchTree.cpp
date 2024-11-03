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

void delete_with_one_child(Node *&root, Node *&location, Node *&parent) {
    Node *child;
    if (location -> left != NULL) 
        child = location -> left;
    else if (location -> right != NULL)
        child = location -> right;
    else 
        child = NULL;
    
    if (parent != NULL) {
        if (location == parent -> left) 
            parent -> left = child;
        else 
            parent -> right = child;
    } else {
        root = child;
    }
}

void delete_with_two_children(Node *&root, Node *&location, Node *&parent) {
    Node *successor, *parent_successor;
    parent_successor = location;
    successor = location -> right;
    while (successor -> left != NULL) {
        parent_successor = successor;
        successor = successor -> left;
    }
    delete_with_one_child(root, successor, parent_successor);
    if (parent != NULL) {
        if (location == parent -> left) 
            parent -> left = successor;
        else 
            parent -> right = successor;
    } else {
        root = successor;
    }
    successor -> left = location -> left;
    successor -> right = location -> right;
}

void delete_node(Node *&root, int item) {
    Node *location, *parent;
    find(root, location, parent, item);
    if (location == NULL) return;
    if (location -> left != NULL && location -> right != NULL) 
        delete_with_two_children(root, location, parent);
    else 
        delete_with_one_child(root, location, parent);
    delete location;
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

void level_order(Node *root) {
    if (root == NULL) return;
    queue<Node*> q;
    q.push(root);
    while (!q.empty()) {
        Node *current = q.front();
        q.pop();
        cout << current -> data << " ";
        if (current -> left != NULL) q.push(current -> left);
        if (current -> right != NULL) q.push(current -> right);
    }
}

int main() {
    Node* tree = NULL;
    // insert(tree, 60);
    // insert(tree, 25);
    // insert(tree, 75);
    // insert(tree, 15);
    // insert(tree, 50);
    // insert(tree, 66);
    // insert(tree, 33);
    // insert(tree, 44);

    int in;
    do {
        cin >> in;
        insert(tree, in);
    }while (in != -1);

    cout << "Before Deletion -> \n";
    cout << "Preorder -> \n";
    preorder(tree);
    cout << "\nInorder -> \n";
    inorder(tree);
    cout << "\nLevel Order -> \n";

    delete_node(tree, 25);

    cout << "After Deletion -> \n";
    cout << "Preorder -> \n";
    preorder(tree);
    cout << "\nInorder -> \n";
    inorder(tree);
    cout << "\nLevel Order -> \n";
    level_order(tree);
}
