from connection import *

# 1

con = ConnectionOrientedFTP()
con.client("test")

# con = ConnectionLessFTP()
# con.client("test")

# 2
# con = ConcurrentFileServer()
# con.client('test')

# 3
# con = EchoBot()
# con.client()

# 4
# con = StreamingClient()
# con.client('test')

# 5
# con = ConnectionOrientedChat()
# con.client()
# con = ConnectionLessChat()
# con.client()

# 6 
# con = MultiClientConnOrientedChat()
# con.client()