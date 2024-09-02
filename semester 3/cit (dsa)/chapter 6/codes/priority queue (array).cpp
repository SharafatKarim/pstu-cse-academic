#include <iostream>
using namespace std;
#define MAX_NUM 2

template <typename T> class PriorityQueue {
private:
    long long front;
    long long rear;
    T arr[MAX_NUM];
    long long priority[MAX_NUM];
public:
    PriorityQueue() {
        front = -1;
        rear = -1;
    }
    int insert(T item, long long item_priority) { 
        if ((front == 0 && rear == MAX_NUM - 1) || (front == rear + 1)) {
            cout << "OVERFLOW!\n";
            return -1;
        } 
        if (front == -1) {
            front = 0;
            rear = 0;
            arr[rear] = item;
            priority[rear] = item_priority;
            return rear;
        } else if (rear == MAX_NUM - 1) {
            rear = 0;
        } else {
            rear++; 
        }
        long long temp_rear = rear;
        while (front != temp_rear && priority[(temp_rear - 1) % MAX_NUM] > item_priority) {
            arr[temp_rear] = arr[(temp_rear - 1) % MAX_NUM];
            priority[temp_rear] = priority[(temp_rear - 1) % MAX_NUM];
            temp_rear = (temp_rear - 1) % MAX_NUM;
        }
        arr[temp_rear] = item;
        priority[temp_rear] = item_priority;
        return temp_rear;
    }
    T pop() {
        if (front == -1) {
            cout << "UNDERFLOW!\n";
            return (T)0;
        }
        T item = arr[front];
        if (front == rear) 
            front = -1, rear = -1;
        else if (front == MAX_NUM - 1)
            front = 0;
        else
            front++;
        return item;
    }
    T peek() {
        return arr[front];
    }
    T back() {
        return arr[rear];
    }
};

int main() {
    PriorityQueue<int> data;
    cout << data.insert(1, 1);
    cout << data.insert(2, 2);
    cout << " " << data.pop() << " ";
    cout << " " << data.pop() << " ";
    cout << data.insert(2, 2);
    cout << data.insert(1, 1);
    // cout << " " << data.pop() << " ";
    // cout << data.insert(3, 3);
    // cout << data.insert(3, 3);
    cout << endl;
    cout << data.peek();
    cout << data.back();
    return 0;
}
