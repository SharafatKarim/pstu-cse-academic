import socket
import threading


def calculate(expression):
    """Evaluate a simple arithmetic expression"""
    try:
        if not all(c in "0123456789+-*/. " for c in expression):
            return "Error: Invalid characters in expression."

        result = eval(expression)
        return str(result)
    except Exception as e:
        return f"Error: {e}"


def start_server(host="127.0.0.1", port=9999):
    """Start the calculator server"""
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind((host, port))
        s.listen()
        print(f"Calculator server listening on {host}:{port}")
        conn, addr = s.accept()
        with conn:
            print("Connected by", addr)
            while True:
                data = conn.recv(1024)
                if not data:
                    break
                expression = data.decode("utf-8")
                result = calculate(expression)
                conn.sendall(result.encode("utf-8"))


def start_threaded_server(host="127.0.0.1", port=9999):
    """Start the calculator server with threading support"""
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind((host, port))
    server_socket.listen()
    print(f"Threaded calculator server listening on {host}:{port}")

    def handle_client(conn, addr):
        print("Connected by", addr)
        with conn:
            while True:
                data = conn.recv(1024)
                if not data:
                    break
                expression = data.decode("utf-8")
                result = calculate(expression)
                conn.sendall(result.encode("utf-8"))
        print("Disconnected from", addr)

    try:
        while True:
            conn, addr = server_socket.accept()
            client_thread = threading.Thread(target=handle_client, args=(conn, addr))
            client_thread.daemon = True
            client_thread.start()
    except KeyboardInterrupt:
        print("\nShutting down server.")
    finally:
        server_socket.close()


if __name__ == "__main__":
    start_threaded_server()
