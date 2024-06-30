#include <iostream>
using namespace std;
#define MAX_NUM 2

template <typename T> class queue {
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
            return -1;
        } 
        if (front == -1) {
            front = 0;
            rear = 0;
        } else if (rear == MAX_NUM - 1) {
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
    bool isEmpty() {
        return front == -1;
    }
};

template <typename T> class PriorityQueue {
private:
    queue<T> arr_queue[MAX_NUM];
public:
    int insert(T item, long long priority) {
        if (priority > MAX_NUM || priority < 1) {
            cout << "INVALID PRIORITY!\n";
            return -1;
        }
        return arr_queue[priority - 1].insert(item);
    }
    T pop() {
        long long index = 0;
        while (arr_queue[index].isEmpty() && index != MAX_NUM ) {
            index++;
        }
        if (index == MAX_NUM) return (T)0;
        return arr_queue[index].pop();
    }
    T peek() {
        long long index = 0;
        while (arr_queue[index].isEmpty() && index != MAX_NUM ) {
            index++;
        }
        if (index == MAX_NUM) return (T)0;
        return arr_queue[index].peek();
    } 
    T back() {
        long long index = MAX_NUM - 1;
        while (arr_queue[index].isEmpty() && index != -1 ) {
            index--;
        }
        if (index == -1) return (T)0;
        return arr_queue[index].back();
    }
    bool isEmpty() {
        long long index = 0;
        while (arr_queue[index].isEmpty() && index != MAX_NUM ) {
            index++;
        }
        if (index == MAX_NUM) return true;
        return false;
    }
};

int main() {
    PriorityQueue<int> queue_list;
    queue_list.insert(2, 1);
    queue_list.insert(4, 2);
    queue_list.insert(2, 1);
    queue_list.pop();
    queue_list.insert(1, 1);
    // cout << queue_list.isEmpty();
    cout << queue_list.peek();
    cout << queue_list.back();
    return 0;
}

