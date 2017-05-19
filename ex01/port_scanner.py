import socket
print('scanning bbox13 @ 192.168.13.100')
for i in range(1,2**16):
    with socket.socket() as sock:
        try:
            sock.settimeout(0.5)
            sock.connect(('bbox13',i))
            print('porta',i,'aperta')
        except:
            pass
