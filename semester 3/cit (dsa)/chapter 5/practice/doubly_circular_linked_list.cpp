#include <bits/stdc++.h>
using namespace std;

template <typename T> class Node {
public:
  T data;
  Node<T> *next;
  Node<T> *prev;

  Node(T data) {
    this->data = data;
    this->next = nullptr;
    this->prev = nullptr;
  }
};

template <typename T> class DoublyLinkedList {
public:
  Node<T> *head;

  DoublyLinkedList() { head = new Node(0); }
  ~DoublyLinkedList() {
    Node<T> *temp = head;
    while (temp != nullptr) {
      Node<T> *next = temp->next;
      delete temp;
      temp = next;
    }
  }

  void insertAtBeginning(T data) {
    Node<T> *newNode = new Node<T>(data);
    newNode->next = head->next;
    newNode->prev = head;
    head->next = newNode;
  }

  void printAll() {
    Node<T> *temp = head->next;
    while (temp != nullptr) {
      cout << temp->data << " ";
      temp = temp->next;
    }
    cout << endl;
  }

  Node<T>* searchItem(T item) {
    Node<T> *temp = head->next;
    while (temp != nullptr) {
      if (temp->data == item)
        return temp;
      temp = temp->next;
    }
    return nullptr;
  }
};

int main() {
  DoublyLinkedList<int> dll;
  dll.insertAtBeginning(1);
  dll.insertAtBeginning(2);
  dll.insertAtBeginning(3);
  dll.printAll();
  cout << dll.searchItem(2)->data;
  return 0;
}
