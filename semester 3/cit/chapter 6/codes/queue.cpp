#include <iostream>
using namespace std;
#define MAX_NUM 2

template <typename T> class queue
{
private:
    long long front;
    long long rear;
    T arr[MAX_NUM];
public:
    queue() {
        front = -1;
        rear = -1;
    }
    int insert(T item) {
        if ((front == 0 && rear == MAX_NUM - 1) || (front == rear + 1)) {
            cout << "OVERFLOW!\n";
            exit(1);
        } 
        if (front == -1) {
            front = 0;
            rear = 0;
        } else if (rear == MAX_NUM) {
            rear = 0;
        } else {
            rear++;
        }
        arr[rear] = item;
        return rear;
    }
    T pop() {
        if (front == -1) {
            cout << "UNDERFLOW!\n";
            return (T)0;
        }
        T item = arr[front];
        if (front == rear) 
            front = -1, rear = -1;
        else if (front == MAX_NUM)
            front = 0;
        else
            front++;
        return item;
    }
    // T front() {
    //     return arr[front];
    // }
    T rear() {
        return arr[rear];
    }
};

int main() {
    queue<int> data;
    cout << data.insert(5);
    cout << data.insert(5);
    cout << data.insert(5);
    cout << data.front();
    return 0;
}

