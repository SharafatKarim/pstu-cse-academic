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
        rear = 0;
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
};

int main() {
    queue<int> data;
    cout << data.insert(5);
    cout << data.insert(5);
    cout << data.insert(5);
    return 0;
}

