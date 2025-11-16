from connection import *

# 1
# con = ConnectionOrientedFTP()
# con.server()

# con = ConnectionLessFTP()
# con.server()

# 2
# con = ConcurrentFileServer()
# con.server()

# 3
# con = EchoBot()
# con.server()

# 4
# con = StreamingClient()
# con.server()

# 5
# con = ConnectionOrientedChat()
# con.server()
# con = ConnectionLessChat()
# con.server()

# 6 
con = MultiClientConnOrientedChat()
con.server()