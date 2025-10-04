import socket
import threading
from datetime import datetime


class ChattingServer:
    def __init__(self, host="localhost", port=9999):
        self.host = host
        self.port = port
        self.clients = []  # List to track all connected clients
        self.nicknames = {}  # Map sockets to nicknames
        self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.running = False
        self.lock = threading.Lock()  # Thread lock for shared data

    def start_server(self):
        """Start the chat server"""
        self.server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.server_socket.bind((self.host, self.port))
        self.server_socket.listen(5)

        self.running = True
        print(f"🤖 Chat Server started on {self.host}:{self.port}")
        print("Waiting for clients to connect...")

        # Start thread to accept new connections
        accept_thread = threading.Thread(target=self.accept_connections)
        accept_thread.daemon = True
        accept_thread.start()

        # Start thread for server commands
        self.server_commands()

    def accept_connections(self):
        """Accept new client connections in a separate thread"""
        while self.running:
            try:
                client_socket, client_address = self.server_socket.accept()
                print(f"📞 New connection from {client_address}")

                # Start a new thread for each client
                client_thread = threading.Thread(
                    target=self.handle_client, args=(client_socket, client_address)
                )
                client_thread.daemon = True
                client_thread.start()

            except OSError:
                # Server socket closed
                break
            except Exception as e:
                print(f"Error accepting connection: {e}")

    def handle_client(self, client_socket, client_address):
        """Handle communication with a single client"""
        nickname = None

        try:
            # Request nickname from client
            client_socket.send("NICK".encode("utf-8"))
            nickname = client_socket.recv(1024).decode("utf-8")

            with self.lock:
                self.clients.append(client_socket)
                self.nicknames[client_socket] = nickname

            # Broadcast that new user joined
            self.broadcast(f"🎉 {nickname} joined the chat!", exclude=client_socket)
            client_socket.send(
                "✅ Connected to chat server! Type '/help' for commands.".encode(
                    "utf-8"
                )
            )

            print(
                f"👤 {nickname} ({client_address}) joined the chat. Total users: {len(self.clients)}"
            )

            # Handle client messages
            while self.running:
                try:
                    message = client_socket.recv(1024).decode("utf-8")

                    if not message:
                        break

                    if message.startswith("/"):
                        self.handle_command(client_socket, message)
                    else:
                        # Broadcast regular message
                        timestamp = datetime.now().strftime("%H:%M:%S")
                        self.broadcast(f"[{timestamp}] {nickname}: {message}")

                except ConnectionResetError:
                    break
                except Exception as e:
                    print(f"Error with client {nickname}: {e}")
                    break

        except Exception as e:
            print(f"Error handling client {client_address}: {e}")
        finally:
            # Clean up when client disconnects
            self.remove_client(client_socket, nickname)

    def handle_command(self, client_socket, command):
        """Handle client commands"""
        nickname = self.nicknames.get(client_socket, "Unknown")

        if command == "/help":
            help_text = """
Available Commands:
/help - Show this help
/list - List online users
/quit - Leave the chat
            """
            client_socket.send(help_text.encode("utf-8"))

        elif command == "/list":
            with self.lock:
                user_list = "📋 Online users: " + ", ".join(self.nicknames.values())
            client_socket.send(user_list.encode("utf-8"))

        elif command == "/quit":
            client_socket.send("QUIT".encode("utf-8"))
            self.remove_client(client_socket, nickname)

        else:
            client_socket.send(
                "❌ Unknown command. Type /help for available commands.".encode("utf-8")
            )

    def broadcast(self, message, exclude=None):
        """Broadcast message to all connected clients"""
        with self.lock:
            disconnected_clients = []

            for client in self.clients:
                if client != exclude:  # Don't send to excluded client
                    try:
                        client.send(message.encode("utf-8"))
                    except:
                        # Client disconnected
                        disconnected_clients.append(client)

            # Remove disconnected clients
            for client in disconnected_clients:
                self.remove_client(client, self.nicknames.get(client, "Unknown"))

    def remove_client(self, client_socket, nickname):
        """Remove a client from the server"""
        with self.lock:
            if client_socket in self.clients:
                self.clients.remove(client_socket)

            if client_socket in self.nicknames:
                del self.nicknames[client_socket]

        if nickname:
            leave_message = f"👋 {nickname} left the chat."
            print(leave_message)
            self.broadcast(leave_message)
            print(f"📊 Total users online: {len(self.clients)}")

        try:
            client_socket.close()
        except:
            pass

    def server_commands(self):
        """Handle server admin commands in main thread"""
        while self.running:
            try:
                cmd = input("").strip().lower()

                if cmd == "/quit":
                    self.shutdown()
                    break
                elif cmd == "/users":
                    with self.lock:
                        print(f"📊 Online users: {len(self.clients)}")
                        for nick in self.nicknames.values():
                            print(f"  - {nick}")
                elif cmd == "/help":
                    print("Server Commands: /users, /quit, /help")
                else:
                    # Broadcast server message
                    self.broadcast(f"🔔 Server: {cmd}")

            except KeyboardInterrupt:
                self.shutdown()
                break
            except Exception as e:
                print(f"Error in server commands: {e}")

    def shutdown(self):
        """Shutdown the server gracefully"""
        print("\n🛑 Shutting down server...")
        self.running = False
        self.broadcast("🔴 Server is shutting down. Goodbye!")

        with self.lock:
            for client in self.clients:
                try:
                    client.close()
                except:
                    pass

        if self.server_socket:
            self.server_socket.close()

        print("✅ Server shut down successfully.")


if __name__ == "__main__":
    server = ChattingServer(port=9999)
    server.start_server()
