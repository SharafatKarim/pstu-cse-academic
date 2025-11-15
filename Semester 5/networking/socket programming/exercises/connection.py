import socket
import os
import time

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
        print(f"FTP server is listening on {self.host}:{self.port}")

        conn, addr = server_socket.accept()
        print(f"Connected by {addr}")

        with open("received", "wb") as file:
            while True:
                data = conn.recv(self.chunk_size)
                if not data:
                    break
                file.write(data)
                conn.send(b"ACK")

        conn.close()
        server_socket.close()

    def client(self, filename):
        if not os.path.exists(filename):
            print(f"File {filename} not fount")
            return

        client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client_socket.connect((self.host, self.port))
        client_socket.settimeout(self.timeout)

        with open(filename, "rb") as file:
            while True:
                chunk = file.read(self.chunk_size)
                if not chunk:
                    break

                while True:
                    try:
                        client_socket.send(chunk)
                        ack = client_socket.recv(3)
                        if ack == b"ACK":
                            break
                    except socket.timeout:
                        print("Timeout, retransmitting...")
                        continue

            client_socket.close()
            print("File transfer completed.")


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
