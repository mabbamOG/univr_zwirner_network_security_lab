# drop deafult:
iptables -P FORWARD DROP
# accept if forwarding from inside:
iptables -A FORWARD -s 192.168.13.0/24 -j ACCEPT 
# accept when forwarding to inside:
iptables -A FORWARD -d 192.168.13.0/24 -j ACCEPT 
