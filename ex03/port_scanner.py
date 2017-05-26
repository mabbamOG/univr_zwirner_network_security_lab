import socket
print('scanning fw13 @ 192.168.13.254')
for i in range(1,2**16):
    with socket.socket() as sock:
        try:
            sock.settimeout(0.5)
            sock.connect(('fw13',i))
            print('porta',i,'aperta')
        except:
            pass
