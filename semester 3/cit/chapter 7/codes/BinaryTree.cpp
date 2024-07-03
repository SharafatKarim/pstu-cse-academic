#include <iostream>
#include <stack>

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

class BinaryTree {
public:
    Node *root;
    BinaryTree() {
        root = NULL;
    }
    
    void insert(int data) {
        Node *newNode = new Node(data);
        if (root == NULL) {
            root = newNode;
            return;
        }
        stack<Node*> s;
        s.push(root);
        while (!s.empty()) {
            Node *temp = s.top();
            s.pop();
            if (temp->left == NULL) {
                temp->left = newNode;
                return;
            } else {
                s.push(temp->left);
            }
            if (temp->right == NULL) {
                temp->right = newNode;
                return;
            } else {
                s.push(temp->right);
            }
        }
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
};

int main() {
    BinaryTree tree;
    tree.insert(10);
    tree.insert(20);
    tree.insert(30);
    tree.insert(40);
    tree.insert(50);
    tree.insert(60);
    tree.insert(70);
    tree.insert(80);
    tree.insert(90);
    tree.insert(100);
    
    cout << "Preorder Traversal (Recursion): ";
    tree.preOrderTraversal_Recursion(tree.root);
    cout << endl;
    cout << "Preorder Traversal (Iterative): ";
    tree.preOrderTraversal_Iterative(tree.root);
    cout << endl;

    cout << "Inorder Traversal (Recursion): ";
    tree.inOrderTraversal_Recursion(tree.root);
    cout << endl;
    cout << "Inorder Traversal (Iterative): ";
    tree.inOrderTraversal_Iterative(tree.root);
    cout << endl;

    cout << "Postorder Traversal (Recursion): ";
    tree.postOrderTraversal_Recursion(tree.root);
    cout << endl;
    cout << "Postorder Traversal (Iterative): ";
    tree.postOrderTraversal_Iterative(tree.root);
    cout << endl;

    return 0;
}