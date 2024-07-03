#include <bits/stdc++.h>
using namespace std;

// Node class to define the structure of the node
class Node {
public:
    int data;
    Node *left, *right;
    // Parameterized Constructor
    Node(int val)
    {
        data = val;
        left = right = NULL;
    }
};

// Function to insert nodes
Node* insert(Node* root, int data)
{
    // If tree is empty, new node becomes the root
    if (root == NULL) {
        root = new Node(data);
        return root;
    }
    // queue to traverse the tree and find the position to
    // insert the node
    queue<Node*> q;
    q.push(root);
    while (!q.empty()) {
        Node* temp = q.front();
        q.pop();
        // Insert node as the left child of the parent node
        if (temp->left == NULL) {
            temp->left = new Node(data);
            break;
        }
        // If the left child is not null push it to the
        // queue
        else
            q.push(temp->left);
        // Insert node as the right child of parent node
        if (temp->right == NULL) {
            temp->right = new Node(data);
            break;
        }
        // If the right child is not null push it to the
        // queue
        else
            q.push(temp->right);
    }
    return root;
}

/* function to delete the given deepest node
(d_node) in binary tree */
void deletDeepest(Node* root, Node* d_node)
{
    queue<Node*> q;
    q.push(root);
    // Do level order traversal until last node
    Node* temp;
    while (!q.empty()) {
        temp = q.front();
        q.pop();
        if (temp == d_node) {
            temp = NULL;
            delete (d_node);
            return;
        }
        if (temp->right) {
            if (temp->right == d_node) {
                temp->right = NULL;
                delete (d_node);
                return;
            }
            else
                q.push(temp->right);
        }
        if (temp->left) {
            if (temp->left == d_node) {
                temp->left = NULL;
                delete (d_node);
                return;
            }
            else
                q.push(temp->left);
        }
    }
}

/* function to delete element in binary tree */
Node* deletion(Node* root, int key)
{
    if (!root)
        return NULL;
    if (root->left == NULL && root->right == NULL) {
        if (root->data == key)
            return NULL;
        else
            return root;
    }
    queue<Node*> q;
    q.push(root);
    Node* temp;
    Node* key_node = NULL;
    // Do level order traversal to find deepest
    // node(temp) and node to be deleted (key_node)
    while (!q.empty()) {
        temp = q.front();
        q.pop();
        if (temp->data == key)
            key_node = temp;
        if (temp->left)
            q.push(temp->left);
        if (temp->right)
            q.push(temp->right);
    }
    if (key_node != NULL) {
        int x = temp->data;
        key_node->data = x;
        deletDeepest(root, temp);
    }
    return root;
}

// Inorder tree traversal (Left - Root - Right)
void inorderTraversal(Node* root)
{
    if (!root)
        return;
    inorderTraversal(root->left);
    cout << root->data << " ";
    inorderTraversal(root->right);
}

// Preorder tree traversal (Root - Left - Right)
void preorderTraversal(Node* root)
{
    if (!root)
        return;
    cout << root->data << " ";
    preorderTraversal(root->left);
    preorderTraversal(root->right);
}

// Postorder tree traversal (Left - Right - Root)
void postorderTraversal(Node* root)
{
    if (root == NULL)
        return;
    postorderTraversal(root->left);
    postorderTraversal(root->right);
    cout << root->data << " ";
}

// Function for Level order tree traversal
void levelorderTraversal(Node* root)
{
    if (root == NULL)
        return;

    // Queue for level order traversal
    queue<Node*> q;
    q.push(root);
    while (!q.empty()) {
        Node* temp = q.front();
        q.pop();
        cout << temp->data << " ";
        // Push left child in the queue
        if (temp->left)
            q.push(temp->left);
        // Push right child in the queue
        if (temp->right)
            q.push(temp->right);
    }
}

/* Driver function to check the above algorithm. */
int main()
{
    Node* root = NULL;
    // Insertion of nodes
    root = insert(root, 10);
    root = insert(root, 20);
    root = insert(root, 30);
    root = insert(root, 40);

    cout << "Preorder traversal: ";
    preorderTraversal(root);

    cout << "\nInorder traversal: ";
    inorderTraversal(root);

    cout << "\nPostorder traversal: ";
    postorderTraversal(root);

    cout << "\nLevel order traversal: ";
    levelorderTraversal(root);

    // Delete the node with data = 20
    root = deletion(root, 20);

    cout << "\nInorder traversal after deletion: ";
    inorderTraversal(root);
}
