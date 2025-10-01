import socket

def calculate(expression):
    """Evaluate a simple arithmetic expression"""
    try:
        # Only allow digits and basic operators
        if not all(c in "0123456789+-*/. " for c in expression):
            return "Error: Invalid characters in expression."
        
        # Evaluate the expression safely
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

if __name__ == "__main__":
    start_server()