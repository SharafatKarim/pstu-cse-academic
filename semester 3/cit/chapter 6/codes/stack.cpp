#include <iostream>
using namespace std;
#define MAX_NUM 1000

template <typename T> class Stack {
    private:
        long long top;
        T arr[MAX_NUM];
    public:
        Stack() {top=-1;}
        T Push(T obj) {
            arr[++top] = obj;
            return arr[top];
        } long long Pop() {
            if (this ->isEmpty())
                return top;
            return --top;
        } T Peek() {
            return arr[top];
        } bool isEmpty() {
            return (top == -1);
        }
};

int main() {
    Stack<int> s;
    s.Push(5);
    cout << s.Peek() << endl;
    cout << (s.isEmpty()?"True":"False") << endl;
    s.Pop();
    cout << (s.isEmpty()?"True":"False") << endl;
    return 0;
}
