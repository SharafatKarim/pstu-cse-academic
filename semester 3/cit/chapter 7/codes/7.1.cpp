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
        stack<Node *> stack;
        stack.push(root);
        while (!stack.empty()) {
            Node *temp = stack.top();
            stack.pop();
            cout << temp->data << " ";
            if (temp->right != NULL) {
                stack.push(temp->right);
            }
            if (temp->left != NULL) {
                stack.push(temp->left);
            }
        }
    }

    void preOrderTraversal_Iterative_2(Node *root) {
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
    cout << "Preorder Traversal (Iterative): ";
    tree.preOrderTraversal_Iterative_2(tree.root);
    cout << endl;

    return 0;
}