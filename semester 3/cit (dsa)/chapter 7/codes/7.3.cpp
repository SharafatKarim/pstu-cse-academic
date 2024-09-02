#include <iostream>
#include <stack>
#include <queue>
#include <utility>

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

void postOrderTraversal_Recursion(Node *root) {
    if (root == NULL) {
        return;
    }
    postOrderTraversal_Recursion(root->left);
    postOrderTraversal_Recursion(root->right);
    cout << root->data << " ";
}

void postOrderTraversal_Iterative(Node *root) {
    stack<pair<Node*, bool>> s;
    s.push(make_pair(root, true));
    while (!s.empty()) {
        Node *temp = s.top().first;
        bool right_sided = s.top().second;
        if (right_sided) {
            s.pop();
            while(temp != NULL) {
                s.push(make_pair(temp, false));
                if (temp->right != NULL) {
                    s.push(make_pair(temp->right, true));
                }
                temp = temp->left;
            } 
        }
        right_sided = s.top().second;
        if (!right_sided) {
            cout << s.top().first->data << " ";
            s.pop();
        }
    }
}

void postOrderTraversal_Iterative_2(Node *root) {
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

    cout << "Postorder Traversal (Recursion): \n";
    postOrderTraversal_Recursion(tree);
    cout << endl;

    cout << "Postorder Traversal (Iterative): \n";
    postOrderTraversal_Iterative(tree);
    cout << endl;

    cout << "Postorder Traversal (Iterative 2): \n";
    postOrderTraversal_Iterative_2(tree);

    return 0;
}