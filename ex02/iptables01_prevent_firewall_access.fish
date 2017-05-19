# drop default policy:
iptables -P INPUT DROP
# only accept direct connections to firewall if from internal network:
iptables -A INPUT -s 192.168.13.0/24 -j ACCEPT
