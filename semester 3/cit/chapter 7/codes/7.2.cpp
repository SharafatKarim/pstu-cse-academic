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

Node *insert(Node *root, int data) {
    Node *newNode = new Node(data);
    if (root == NULL) {
        root = newNode;
        return root;
    }
    queue<Node*> q;
    q.push(root);
    while (!q.empty()) {
        Node *temp = q.front();
        q.pop();
        if (temp->left == NULL) {
            temp->left = newNode;
            return root;
        } else {
            q.push(temp->left);
        }
        if (temp->right == NULL) {
            temp->right = newNode;
            return root;
        } else {
            q.push(temp->right);
        }
    }
    return root;
}
  
void inOrderTraversal_Recursion(Node *root) {
    if (root == NULL) {
        return;
    }
    inOrderTraversal_Recursion(root->left);
    cout << root->data << " ";
    inOrderTraversal_Recursion(root->right);
} 

void inOrderTraversal_Iterative(Node *root) {
    stack<Node*> s;
    Node *curr = root;
    while (curr != NULL || !s.empty()) {
        while (curr != NULL) {
            s.push(curr);
            curr = curr->left;
        }
        curr = s.top();
        s.pop();
        cout << curr->data << " ";
        curr = curr->right;
    }
}

int main() {
    Node *tree = NULL;
    tree = insert(tree, 10);
    tree = insert(tree, 20);
    tree = insert(tree, 30);
    tree = insert(tree, 40);
    tree = insert(tree, 50);
    tree = insert(tree, 60);
    tree = insert(tree, 70);
    tree = insert(tree, 80);
    tree = insert(tree, 90);
    tree = insert(tree, 100);

    cout << "Inorder Traversal (Recursion): ";
    inOrderTraversal_Recursion(tree);
    cout << endl;
    cout << "Inorder Traversal (Iterative): ";
    inOrderTraversal_Iterative(tree);
    cout << endl;

    return 0;
}