import socket


def client_program(host="127.0.0.1", port=9999):
    """Start a simple calculator client"""

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        try:
            s.connect((host, port))
            print(f"✅ Connected to calculator server at {host}:{port}")

            while True:
                expression = input("Enter expression (or 'exit' to quit): ")
                if expression.lower() == "exit":
                    print("👋 Exiting calculator client.")
                    break

                s.sendall(expression.encode("utf-8"))
                data = s.recv(1024)
                print(f"Result: {data.decode('utf-8')}")

        except ConnectionRefusedError:
            print(
                f"❌ Could not connect to server at {host}:{port}. Is the server running?"
            )
        except Exception as e:
            print(f"❌ An error occurred: {e}")


if __name__ == "__main__":
    client_program()
