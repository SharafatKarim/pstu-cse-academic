#include<bits/stdc++.h>
using namespace std;

int next_id=1;
atomic<bool> lock_var = false;

bool test_and_set()
{
    bool rv=lock_var;
    lock_var=true;
    return rv;
}
void acquire_lock()
{
    while(test_and_set());
}

void release_lock()
{
    lock_var=false;
}
void generate_id(int i)
{
    acquire_lock();

    int temp=next_id;
    this_thread::sleep_for(chrono::milliseconds(10));
    next_id=temp+1;
    cout<<"Thread "<<i<<" Assigned ID: "<<temp<<endl;

    release_lock();
}
int main()
{
    vector<thread>threads;
    for(int i=0;i<10;i++)
    {
        threads.push_back(thread(generate_id,i));
    }
    for(auto &t:threads)
    {
        t.join();
    }
}
