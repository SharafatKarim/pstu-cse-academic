import socket
import threading
import time

class ChatClient:
    def __init__(self, host='localhost', port=9999):
        self.host = host
        self.port = port
        self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.nickname = ""
        self.running = False
    
    def start_client(self):
        """Start the chat client"""
        try:
            self.client_socket.connect((self.host, self.port))
            self.running = True
            
            # Get nickname from user
            self.nickname = input("Enter your nickname: ")
            self.client_socket.send(self.nickname.encode('utf-8'))
            
            # Start thread for receiving messages
            receive_thread = threading.Thread(target=self.receive_messages)
            receive_thread.daemon = True
            receive_thread.start()
            
            print(f"✅ Connected to chat server as {self.nickname}")
            print("Type your messages below (type '/help' for commands)")
            print("-" * 50)
            
            # Main thread handles sending messages
            self.send_messages()
            
        except Exception as e:
            print(f"❌ Failed to connect to server: {e}")
        finally:
            self.disconnect()
    
    def receive_messages(self):
        """Receive messages from server in a separate thread"""
        while self.running:
            try:
                message = self.client_socket.recv(1024).decode('utf-8')
                
                if not message:
                    break
                
                if message == "NICK":
                    self.client_socket.send(self.nickname.encode('utf-8'))
                elif message == "QUIT":
                    print("\n👋 Disconnecting from server...")
                    break
                else:
                    print(f"\r{message}\nYou: ", end='')
                    
            except ConnectionResetError:
                print("\n❌ Connection lost with server")
                break
            except Exception as e:
                if self.running:
                    print(f"\nError receiving message: {e}")
                break
    
    def send_messages(self):
        """Send messages to server in main thread"""
        while self.running:
            try:
                message = input("You: ").strip()
                
                if message.lower() == '/quit':
                    self.client_socket.send('/quit'.encode('utf-8'))
                    break
                elif message:
                    self.client_socket.send(message.encode('utf-8'))
                    
            except KeyboardInterrupt:
                print("\n👋 Disconnecting...")
                self.client_socket.send('/quit'.encode('utf-8'))
                break
            except Exception as e:
                print(f"Error sending message: {e}")
                break
    
    def disconnect(self):
        """Clean up client connection"""
        self.running = False
        if self.client_socket:
            self.client_socket.close()
        print("✅ Disconnected from server.")

if __name__ == "__main__":
    client = ChatClient(port=9999)
    client.start_client()