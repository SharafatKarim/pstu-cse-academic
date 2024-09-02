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
    
void preOrderTraversal_Recursion(Node *root) {
    if (root == NULL) {
        return;
    }
    cout << root->data << " ";
    preOrderTraversal_Recursion(root->left);
    preOrderTraversal_Recursion(root->right);
}

void preOrderTraversal_Iterative(Node *root) {
    stack<Node*> s;
    s.push(root);
    while (!s.empty()) {
        Node *temp = s.top();
        s.pop();
        cout << temp->data << " ";
        if (temp->right != NULL) {
            s.push(temp->right);
        }
        if (temp->left != NULL) {
            s.push(temp->left);
        }
    }
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

void postOrderTraversal_Recursion(Node *root) {
    if (root == NULL) {
        return;
    }
    postOrderTraversal_Recursion(root->left);
    postOrderTraversal_Recursion(root->right);
    cout << root->data << " ";
}

void postOrderTraversal_Iterative(Node *root) {
    stack<Node*> s1;
    stack<Node*> s2;
    s1.push(root);
    while (!s1.empty()) {
        Node *temp = s1.top();
        s1.pop();
        s2.push(temp);
        if (temp->left != NULL) {
            s1.push(temp->left);
        }
        if (temp->right != NULL) {
            s1.push(temp->right);
        }
    }
    while (!s2.empty()) {
        cout << s2.top()->data << " ";
        s2.pop();
    }
}

void levelOrderTraversal(Node *root) {
    queue<Node*> q;
    q.push(root);
    while (!q.empty()) {
        Node *temp = q.front();
        q.pop();
        cout << temp->data << " ";
        if (temp->left != NULL) {
            q.push(temp->left);
        }
        if (temp->right != NULL) {
            q.push(temp->right);
        }
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

    cout << "Preorder Traversal (Recursion): ";
    preOrderTraversal_Recursion(tree);
    cout << endl;
    cout << "Preorder Traversal (Iterative): ";
    preOrderTraversal_Iterative(tree);
    cout << endl;
    cout << "Inorder Traversal (Recursion): ";
    inOrderTraversal_Recursion(tree);
    cout << endl;
    cout << "Inorder Traversal (Iterative): ";
    inOrderTraversal_Iterative(tree);
    cout << endl;
    cout << "Postorder Traversal (Recursion): ";
    postOrderTraversal_Recursion(tree);
    cout << endl;
    cout << "Postorder Traversal (Iterative): ";
    postOrderTraversal_Iterative(tree);
    cout << endl;

    cout << "Level Order Traversal: ";
    levelOrderTraversal(tree);
    cout << endl;

    return 0;
}