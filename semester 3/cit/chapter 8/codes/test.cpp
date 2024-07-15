#include <bits/stdc++.h>
using namespace std;
struct Node
{
    int data;
    struct Node *next;
};

Node *linkedListTraversal(struct Node *ptr, int item)
{
    while (ptr != NULL)
    {
        if (item == ptr->data)
        {
            cout << ptr->next << "\n";
            return ptr;
        }
        else
        {
            ptr = ptr->next;
        }
    }
    return NULL;
}

int main()
{
    // node er naam declare
    struct Node *head;
    struct Node *second;
    struct Node *third;
    struct Node *fourth;

    // Allocate memory for nodes in the linked list in Heap
    head = (struct Node *)malloc(sizeof(struct Node));
    second = (struct Node *)malloc(sizeof(struct Node));
    third = (struct Node *)malloc(sizeof(struct Node));
    fourth = (struct Node *)malloc(sizeof(struct Node));

    // Link first and second nodes
    head->data = 7;
    head->next = second;

    // Link second and third nodes
    second->data = 11;
    second->next = third;

    // Link third and fourth nodes
    third->data = 41;
    third->next = fourth;

    // Terminate the list at the third node
    fourth->data = 66;
    fourth->next = NULL;

    int item = 11;
    auto searchedResult = linkedListTraversal(head, item);
    if (searchedResult)
    {
        cout << "Found" << searchedResult->data << endl;
    }
    else
    {
        cout << "Not found";
    }
    return 0;
}
