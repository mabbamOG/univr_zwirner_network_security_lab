# iptables -A -s 192.168.13.0/24 -j ACCEPT # this is too permissive
# whitelist:
iptables -A INPUT -s 192.168.13.0/24 -m state --state NEW -j ACCEPT # more efficient if less

# connection established:
iptables -I INPUT 1 -m state --state ESTABLISHED,RELATED -j ACCEPT # one cmd more efficient
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# drop all
iptables -P INPUT DROP
iptables -P OUTPUT DROP
