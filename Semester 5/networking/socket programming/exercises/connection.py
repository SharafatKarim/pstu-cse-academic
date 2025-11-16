import socket
import os
import time
import threading

class ConnectionOrientedFTP:
    def __init__(self, host="localhost", port=12345) -> None:
        self.host = host
        self.port = port
        self.chunk_size = 100
        self.timeout = 2.0

    def server(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_socket.bind((self.host, self.port))
        server_socket.listen()

        conn, addr = server_socket.accept()
        with open("received", "wb") as file:
            while True:
                chunk = conn.recv(self.chunk_size)
                file.write(chunk)
                if not chunk:
                    break
                conn.send(b'ACK')
                    
        conn.close()
        server_socket.close()
        print("File transfer completed.")


    def client(self, filename):
        if not os.path.exists(filename):
            print("File not found.")
            return

        client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client_socket.connect((self.host, self.port))
        client_socket.settimeout(self.timeout)
        print("Connection established")

        with open(filename, "rb") as file:
            while True:
                chunk = file.read(self.chunk_size)
                if not chunk:
                    break

                while True:
                    try:
                        client_socket.send(chunk)
                        if client_socket.recv(3) == b'ACK':
                            break

                    except socket.timeout:
                        print("Retransmitting...")
                        continue
        
        client_socket.close()


# TODO: later
class ConnectionLessFTP:
    def __init__(self, host="localhost", port=12345) -> None:
        self.host = host
        self.port = port
        self.chunk_size = 100
        self.timeout = 2.0

    def server(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        server_socket.bind((self.host, self.port))
        print(f"FTP UDP server is listening on {self.host}:{self.port}")

        with open("received", "wb") as file:
            while True:
                data, addr = server_socket.recvfrom(1024)
                if data == b'END':
                    break
                file.write(data)

        server_socket.close()

    def client(self, filename):
        if not os.path.exists(filename):
            print(f"File {filename} not fount")
            return

        client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

        with open(filename, "rb") as file:
            for line in file:
                client_socket.sendto(line, (self.host, self.port))

        client_socket.sendto(b'END', (self.host, self.port))        
        client_socket.close()
        print("File transfer completed.")

class ConcurrentFileServer:
    def __init__(self, host="localhost", port=12345) -> None:
        self.host = host
        self.port = port
        self.chunk_size = 100
        self.timeout = 2.0
    
    def server(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_socket.bind((self.host, self.port))
        server_socket.listen()

        while True:
            conn, addr = server_socket.accept()
            filename = conn.recv(1000)
            thread = threading.Thread(target=self.handle_client, args=(conn, addr, filename.decode()))
            thread.start()
    
    def handle_client(self, conn, addr, filename):
        if not os.path.exists(filename):
            print("File not found.")
            return
        
        with open(filename, "rb") as file:
            while True:
                chunk = file.read(self.chunk_size)
                if not chunk:
                    break

                while True:
                    try:
                        conn.send(chunk)
                        if conn.recv(3) == b'ACK':
                            break

                    except socket.timeout:
                        print("Retransmitting...")
                        continue
        
        conn.close()

    def client(self, filename):
        client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client_socket.connect((self.host, self.port))
        client_socket.settimeout(self.timeout)
        print("Connection established")

        client_socket.send(filename.encode())

        with open("received", "wb") as file:
            while True:
                chunk = client_socket.recv(self.chunk_size)
                file.write(chunk)
                if not chunk:
                    break
                client_socket.send(b'ACK')
                    
        client_socket.close()
        print("File transfer completed.")

class EchoBot:
    def __init__(self, host="localhost", port=12345) -> None:
        self.host = host
        self.port = port
        self.chunk_size = 100
        self.timeout = 2.0
    
    def server(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_socket.bind((self.host, self.port))
        server_socket.listen()

        while True:
            conn, addr = server_socket.accept()
            thread = threading.Thread(target=self.handle_client, args=(conn, addr))
            thread.start()
    
    def handle_client(self, conn, addr):
        while True:
            text = conn.recv(self.chunk_size)
            if not text:
                break
            print(text.decode())
            conn.sendall(text)

    def client(self):
        client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client_socket.connect((self.host, self.port))
        client_socket.settimeout(self.timeout)
        print("Connection established")

        while True:
            text = input()
            client_socket.send(text.strip().encode())
            ans = client_socket.recv(self.chunk_size)
            print("💬 ", ans.decode())

class StreamingClient:
    def __init__(self, host="localhost", port=12345) -> None:
        self.host = host
        self.port = port
        self.chunk_size = 5000
        self.timeout = 2.0
    
    def server(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        server_socket.bind((self.host, self.port))
        print(f"Streaming UDP server is listening on {self.host}:{self.port}")
        data, addr = server_socket.recvfrom(self.chunk_size)
        filename = data.decode()

        if not os.path.exists(filename):
            print("File not found.")
            return
        
        with open(filename, "rb") as file:
            for line in file:
                server_socket.sendto(line, addr)
                time.sleep(0.01)  # simulate streaming delay
        server_socket.sendto(b'END', addr)

        server_socket.close()

    def client(self, filename):
        client_socket = socket.socket(socket
        
        .AF_INET, socket.SOCK_DGRAM)
        client_socket.sendto(filename.encode(), (self.host, self.port))

        with open("received", "wb") as file:
            while True:
                data, addr = client_socket.recvfrom(self.chunk_size)
                if data == b'END':
                    break
                file.write(data)
                print(f"Received chunk of size {len(data)} bytes")
        
        client_socket.close()



class ConnectionOrientedChat:
    def __init__(self, host="localhost", port=12345) -> None:
        self.host = host
        self.port = port
        self.chunk_size = 100
        self.timeout = 2.0
    
    def server(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_socket.bind((self.host, self.port))
        print("Server running...")

        server_socket.listen()
        conn, addr = server_socket.accept()

        try:
            while True:
                msg = conn.recv(self.chunk_size)
                print("Client -> ", msg.decode())

                msg = input()
                if msg:
                    conn.send(msg.strip().encode())

        except KeyboardInterrupt:
            print("Exitting...")
            exit()
    
    def client(self):
        client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client_socket.connect((self.host, self.port))
        print("Client started...")

        try:
            while True:
                msg = input()
                if msg:
                    client_socket.send(msg.strip().encode())

                msg = client_socket.recv(self.chunk_size)
                print("Server -> ", msg.decode())

        except KeyboardInterrupt:
            print("Exitting...")
            exit()        


class ConnectionLessChat:
    def __init__(self, host="localhost", port=12345) -> None:
        self.host = host
        self.port = port
        self.chunk_size = 100
        self.timeout = 2.0
    
    def server(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        server_socket.bind((self.host, self.port))
        print("Server running...")

        try:
            while True:
                msg, addr = server_socket.recvfrom(self.chunk_size)
                print("Client -> ", msg.decode())

                msg = input()
                if msg:
                    server_socket.sendto(msg.strip().encode(), addr)

        except KeyboardInterrupt:
            print("Exitting...")
            exit()
    
    def client(self):
        client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        print("Client started...")

        try:
            while True:
                msg = input()
                if msg:
                    client_socket.sendto(msg.strip().encode(), (self.host, self.port))

                msg, addr = client_socket.recvfrom(self.chunk_size)
                print("Server -> ", msg.decode())

        except KeyboardInterrupt:
            print("Exitting...")
            exit()        


class MultiClientConnOrientedChat:
    def __init__(self, host="localhost", port=12345) -> None:
        self.host = host
        self.port = port
        self.chunk_size = 100
        self.timeout = 2.0
    

    def handle_client(self, conn, addr):
        try:
            while True:
                msg = conn.recv(self.chunk_size)
                print("Client -> ", msg.decode())

                msg = input()
                if msg:
                    conn.send(msg.strip().encode())

        except KeyboardInterrupt:
            print("Exitting...")
            exit()

    def server(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_socket.bind((self.host, self.port))
        print("Server running...")

        server_socket.listen()
        conn, addr = server_socket.accept()
        thread = threading.Thread(target=self.handle_client, args=(conn, addr))
        thread.start()

    def client(self):
        client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client_socket.connect((self.host, self.port))
        print("Client started...")

        try:
            while True:
                msg = input()
                if msg:
                    client_socket.send(msg.strip().encode())

                msg = client_socket.recv(self.chunk_size)
                print("Server -> ", msg.decode())

        except KeyboardInterrupt:
            print("Exitting...")
            exit()        
