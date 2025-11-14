## 1. File Transfer Protocol (FTP)

### Connection-Oriented FTP

```python
import socket
import os
import time

class ConnectionOrientedFTP:
    def __init__(self, host='localhost', port=12345):
        self.host = host
        self.port = port
        self.chunk_size = 100
        self.timeout = 2.0
    
    def server(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_socket.bind((self.host, self.port))
        server_socket.listen(1)
        print(f"FTP Server listening on {self.host}:{self.port}")
        
        conn, addr = server_socket.accept()
        print(f"Connected by {addr}")
        
        with open('received_file.txt', 'wb') as file:
            while True:
                data = conn.recv(self.chunk_size)
                if not data:
                    break
                file.write(data)
                conn.send(b'ACK')  # Send acknowledgment
        
        conn.close()
        server_socket.close()
    
    def client(self, filename):
        if not os.path.exists(filename):
            print(f"File {filename} not found")
            return
        
        client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client_socket.connect((self.host, self.port))
        client_socket.settimeout(self.timeout)
        
        with open(filename, 'rb') as file:
            while True:
                chunk = file.read(self.chunk_size)
                if not chunk:
                    break
                
                while True:
                    try:
                        client_socket.send(chunk)
                        ack = client_socket.recv(3)
                        if ack == b'ACK':
                            break
                    except socket.timeout:
                        print("Timeout, retransmitting...")
                        continue
        
        client_socket.close()
        print("File transfer completed")

class ConnectionlessFTP:
    def __init__(self, host='localhost', port=12346):
        self.host = host
        self.port = port
    
    def server(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        server_socket.bind((self.host, self.port))
        print(f"Connectionless FTP Server listening on {self.host}:{self.port}")
        
        with open('received_file_udp.txt', 'w') as file:
            while True:
                data, addr = server_socket.recvfrom(1024)
                if data == b'END':
                    break
                file.write(data.decode() + '\n')
        
        server_socket.close()
    
    def client(self, filename):
        if not os.path.exists(filename):
            print(f"File {filename} not found")
            return
        
        client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        
        with open(filename, 'r') as file:
            for line in file:
                client_socket.sendto(line.strip().encode(), (self.host, self.port))
        
        client_socket.sendto(b'END', (self.host, self.port))
        client_socket.close()
        print("File transfer completed")
```

## 2. Concurrent File Server

```python
import socket
import threading
import time

class ConcurrentFileServer:
    def __init__(self, host='localhost', port=12347):
        self.host = host
        self.port = port
        self.chunk_size = 1000
    
    def handle_client(self, conn, addr, filename):
        print(f"Thread {threading.current_thread().name} handling {addr} for file {filename}")
        
        try:
            with open(filename, 'rb') as file:
                while True:
                    chunk = file.read(self.chunk_size)
                    if not chunk:
                        break
                    conn.send(chunk)
                    time.sleep(0.2)  # Sleep for 200ms
        except FileNotFoundError:
            conn.send(b'FILE_NOT_FOUND')
        
        conn.close()
        print(f"Transfer completed for {addr}")
    
    def server(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_socket.bind((self.host, self.port))
        server_socket.listen(5)
        print(f"Concurrent File Server listening on {self.host}:{self.port}")
        
        while True:
            conn, addr = server_socket.accept()
            filename = conn.recv(1024).decode()
            
            client_thread = threading.Thread(
                target=self.handle_client,
                args=(conn, addr, filename),
                name=f"ClientHandler-{addr}"
            )
            client_thread.start()

class FileClient:
    def __init__(self, host='localhost', port=12347):
        self.host = host
        self.port = port
    
    def download_file(self, filename, save_as):
        client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client_socket.connect((self.host, self.port))
        
        client_socket.send(filename.encode())
        
        with open(save_as, 'wb') as file:
            while True:
                data = client_socket.recv(1000)
                if data == b'FILE_NOT_FOUND':
                    print("File not found on server")
                    break
                if not data:
                    break
                file.write(data)
        
        client_socket.close()
        print(f"File downloaded as {save_as}")
```

## 3. Remote Calculator

```python
import socket

class RemoteCalculator:
    def __init__(self, host='localhost', port=12348):
        self.host = host
        self.port = port
    
    def server(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_socket.bind((self.host, self.port))
        server_socket.listen(1)
        print(f"Calculator Server listening on {self.host}:{self.port}")
        
        while True:
            conn, addr = server_socket.accept()
            print(f"Connected by {addr}")
            
            try:
                data = conn.recv(1024).decode()
                num1, op, num2 = data.split()
                num1, num2 = int(num1), int(num2)
                
                if op == '+':
                    result = num1 + num2
                elif op == '-':
                    result = num1 - num2
                elif op == '*':
                    result = num1 * num2
                elif op == '/':
                    result = num1 / num2 if num2 != 0 else 'Error: Division by zero'
                elif op == '%':
                    result = num1 % num2 if num2 != 0 else 'Error: Modulo by zero'
                else:
                    result = 'Error: Invalid operator'
                
                conn.send(str(result).encode())
            except Exception as e:
                conn.send(f"Error: {str(e)}".encode())
            
            conn.close()
    
    def client(self):
        client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client_socket.connect((self.host, self.port))
        
        try:
            num1 = int(input("Enter first number: "))
            num2 = int(input("Enter second number: "))
            op = input("Enter operation (+, -, *, /, %): ")
            
            message = f"{num1} {op} {num2}"
            client_socket.send(message.encode())
            
            result = client_socket.recv(1024).decode()
            print(f"Result: {result}")
        
        finally:
            client_socket.close()
```

## 4. Streaming Client-Server

```python
import socket
import random
import threading

class StreamingServer:
    def __init__(self, host='localhost', port=12349):
        self.host = host
        self.port = port
    
    def server(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        server_socket.bind((self.host, self.port))
        print(f"Streaming Server listening on {self.host}:{self.port}")
        
        while True:
            data, addr = server_socket.recvfrom(1024)
            filename = data.decode()
            print(f"Client {addr} requested: {filename}")
            
            try:
                with open(filename, 'rb') as file:
                    while True:
                        chunk_size = random.randint(1000, 2000)
                        chunk = file.read(chunk_size)
                        if not chunk:
                            server_socket.sendto(b'END', addr)
                            break
                        server_socket.sendto(chunk, addr)
            except FileNotFoundError:
                server_socket.sendto(b'FILE_NOT_FOUND', addr)

class StreamingClient:
    def __init__(self, host='localhost', port=12349):
        self.host = host
        self.port = port
    
    def stream_file(self, filename, save_as):
        client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        client_socket.sendto(filename.encode(), (self.host, self.port))
        
        with open(save_as, 'wb') as file:
            while True:
                data, addr = client_socket.recvfrom(2048)
                if data == b'END':
                    break
                elif data == b'FILE_NOT_FOUND':
                    print("File not found on server")
                    break
                file.write(data)
                print(f"Received {len(data)} bytes")
        
        client_socket.close()
        print(f"Streaming completed. File saved as {save_as}")
```

## 5. Chat Application

### Connection-Oriented Chat

```python
import socket
import threading

class ConnectionOrientedChat:
    def __init__(self, host='localhost', port=12350):
        self.host = host
        self.port = port
    
    def server(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_socket.bind((self.host, self.port))
        server_socket.listen(1)
        print(f"Chat Server listening on {self.host}:{self.port}")
        
        conn, addr = server_socket.accept()
        print(f"Connected by {addr}")
        
        try:
            while True:
                # Receive message
                data = conn.recv(1024).decode()
                if not data or data == 'QUIT':
                    break
                print(f"Client: {data}")
                
                # Send reply
                reply = input("You: ")
                conn.send(reply.encode())
        except KeyboardInterrupt:
            print("\nChat ended")
        finally:
            conn.close()
            server_socket.close()
    
    def client(self):
        client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client_socket.connect((self.host, self.port))
        
        try:
            while True:
                # Send message
                message = input("You: ")
                client_socket.send(message.encode())
                if message == 'QUIT':
                    break
                
                # Receive reply
                reply = client_socket.recv(1024).decode()
                print(f"Server: {reply}")
        except KeyboardInterrupt:
            print("\nChat ended")
        finally:
            client_socket.close()
```

### Connectionless Chat

```python
class ConnectionlessChat:
    def __init__(self, host='localhost', port=12351, peer_port=12352):
        self.host = host
        self.port = port
        self.peer_port = peer_port
        self.max_chars = 1000
    
    def start_chat(self):
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.bind((self.host, self.port))
        
        def receive_messages():
            while True:
                try:
                    data, addr = sock.recvfrom(self.max_chars)
                    print(f"\nPeer: {data.decode()}\nYou: ", end='')
                except:
                    break
        
        receiver = threading.Thread(target=receive_messages)
        receiver.daemon = True
        receiver.start()
        
        try:
            while True:
                message = input("You: ")
                sock.sendto(message.encode(), (self.host, self.peer_port))
        except KeyboardInterrupt:
            print("\nChat ended")
        finally:
            sock.close()
```

## 6. Multi-Client Chat Server

```python
class MultiClientChatServer:
    def __init__(self, host='localhost', port=12352):
        self.host = host
        self.port = port
        self.clients = []
    
    def handle_client(self, conn, addr):
        print(f"New connection from {addr}")
        
        try:
            while True:
                message = conn.recv(1024).decode()
                if not message or message == 'QUIT':
                    break
                print(f"Client {addr}: {message}")
                
                reply = input(f"Reply to {addr}: ")
                conn.send(reply.encode())
        except:
            pass
        finally:
            conn.close()
            print(f"Connection with {addr} closed")
    
    def server(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_socket.bind((self.host, self.port))
        server_socket.listen(5)
        print(f"Multi-Client Chat Server listening on {self.host}:{self.port}")
        
        try:
            while True:
                conn, addr = server_socket.accept()
                client_thread = threading.Thread(
                    target=self.handle_client,
                    args=(conn, addr)
                )
                client_thread.daemon = True
                client_thread.start()
        except KeyboardInterrupt:
            print("\nServer shutting down")
        finally:
            server_socket.close()
```

## 7. Multicast Chat Tool

```python
import socket
import struct
import threading

class MulticastChat:
    def __init__(self, group='224.1.1.1', port=12353, ttl=1):
        self.group = group
        self.port = port
        self.ttl = ttl
        
    def start_chat(self):
        # Create socket
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        
        # Bind to group and port
        sock.bind(('', self.port))
        
        # Join multicast group
        mreq = struct.pack("4sl", socket.inet_aton(self.group), socket.INADDR_ANY)
        sock.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)
        
        def receive_messages():
            while True:
                try:
                    data, addr = sock.recvfrom(1024)
                    if addr[0] != socket.gethostbyname(socket.gethostname()):
                        print(f"\n{addr[0]}: {data.decode()}\nYou: ", end='')
                except:
                    break
        
        receiver = threading.Thread(target=receive_messages)
        receiver.daemon = True
        receiver.start()
        
        # Set TTL
        sock.setsockopt(socket.IPPROTO_IP, socket.IP_MULTICAST_TTL, self.ttl)
        
        print("Multicast Chat Started! Type your messages:")
        try:
            while True:
                message = input("You: ")
                sock.sendto(message.encode(), (self.group, self.port))
        except KeyboardInterrupt:
            print("\nChat ended")
        finally:
            sock.close()
```

## 8. Election Vote Casting

```python
import socket
import struct
import threading
import time

class ElectionVote:
    def __init__(self, group='224.1.1.2', port=12354, ttl=1):
        self.group = group
        self.port = port
        self.ttl = ttl
        self.votes = {'A': 0, 'B': 0}
        self.vote_count = 0
        self.total_electorates = 5
        self.lock = threading.Lock()
    
    def cast_vote(self, electorate_id):
        # Create socket for sending
        send_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
        send_sock.setsockopt(socket.IPPROTO_IP, socket.IP_MULTICAST_TTL, self.ttl)
        
        # Get vote from user
        while True:
            vote = input(f"Electorate {electorate_id}, enter your vote (A/B): ").upper()
            if vote in ['A', 'B']:
                break
            print("Invalid vote! Please enter A or B")
        
        # Send vote
        vote_message = f"VOTE:{electorate_id}:{vote}"
        send_sock.sendto(vote_message.encode(), (self.group, self.port))
        print(f"Vote cast: {vote}")
        
        send_sock.close()
    
    def receive_votes(self, electorate_id):
        # Create socket for receiving
        recv_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
        recv_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        recv_sock.bind(('', self.port))
        
        # Join multicast group
        mreq = struct.pack("4sl", socket.inet_aton(self.group), socket.INADDR_ANY)
        recv_sock.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)
        
        print("Waiting for all votes...")
        
        while self.vote_count < self.total_electorates:
            data, addr = recv_sock.recvfrom(1024)
            message = data.decode()
            
            if message.startswith("VOTE:"):
                _, voter_id, vote = message.split(':')
                
                with self.lock:
                    if voter_id != str(electorate_id):  # Don't count own vote twice
                        self.votes[vote] += 1
                        self.vote_count += 1
                        print(f"Received vote from electorate {voter_id}: {vote}")
        
        recv_sock.close()
    
    def start_election(self, electorate_id):
        # Thread for receiving votes
        receiver = threading.Thread(target=self.receive_votes, args=(electorate_id,))
        receiver.start()
        
        # Cast vote
        self.cast_vote(electorate_id)
        
        # Count own vote
        with self.lock:
            self.vote_count += 1
        
        # Wait for all votes
        receiver.join()
        
        # Determine winner
        if self.votes['A'] > self.votes['B']:
            winner = 'A'
        elif self.votes['B'] > self.votes['A']:
            winner = 'B'
        else:
            winner = 'Tie'
        
        print(f"\nElection Results:")
        print(f"Candidate A: {self.votes['A']} votes")
        print(f"Candidate B: {self.votes['B']} votes")
        print(f"Winner: {winner}")
```

## Usage Examples

```python
if __name__ == "__main__":
    # Example usage - uncomment what you want to test
    
    # 1. FTP Test
    # ftp = ConnectionOrientedFTP()
    # Run server in one terminal: ftp.server()
    # Run client in another: ftp.client('test_file.txt')
    
    # 2. Concurrent File Server Test
    # server = ConcurrentFileServer()
    # Run server: server.server()
    # client = FileClient()
    # Run client: client.download_file('requested_file.txt', 'downloaded_file.txt')
    
    # 3. Calculator Test
    # calc = RemoteCalculator()
    # Run server: calc.server()
    # Run client: calc.client()
    
    # 4. Streaming Test
    # stream_server = StreamingServer()
    # Run server: stream_server.server()
    # stream_client = StreamingClient()
    # Run client: stream_client.stream_file('video.mp4', 'received_video.mp4')
    
    # 5. Chat Test
    # chat = ConnectionOrientedChat()
    # Run server: chat.server()
    # Run client: chat.client()
    
    # 6. Multi-Client Chat
    # multi_chat = MultiClientChatServer()
    # Run server: multi_chat.server()
    
    # 7. Multicast Chat
    # multicast = MulticastChat()
    # Run multiple instances: multicast.start_chat()
    
    # 8. Election
    # election = ElectionVote()
    # Run multiple instances with different IDs: election.start_election(1)
    pass
```
