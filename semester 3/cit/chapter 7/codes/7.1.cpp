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
        queue<Node*> q;
        q.push(root);
        while (!q.empty()) {
            Node *temp = q.front();
            q.pop();
            if (temp->left == NULL) {
                temp->left = newNode;
                return;
            } else {
                q.push(temp->left);
            }
            if (temp->right == NULL) {
                temp->right = newNode;
                return;
            } else {
                q.push(temp->right);
            }
        }
    }
    
    // this is the reason we needed to keep root as public
    void preOrderTraversal_Recursion(Node *root) {
        if (root == NULL) {
            return;
        }
        cout << root->data << " ";
        preOrderTraversal_Recursion(root->left);
        preOrderTraversal_Recursion(root->right);
    }

    void preOrderTraversal_Iterative() {
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
    tree.preOrderTraversal_Iterative();
    cout << endl;

    return 0;
}