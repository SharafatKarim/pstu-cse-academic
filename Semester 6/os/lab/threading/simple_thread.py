import threading

def func():
    print("Hello from a thread!")

t1 = threading.Thread(target=func)

t1.start()
t1.join()

print("Thread finished!")
