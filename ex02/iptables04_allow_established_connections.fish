### CLEANY CLEANY
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD

# iptables -A -s 192.168.13.0/24 -j ACCEPT # this is too permissive
# whitelist:
iptables -A INPUT -s 192.168.13.0/24 -m state --state NEW -j ACCEPT # more efficient if less

# connection established:
iptables -I INPUT 1 -m state --state ESTABLISHED,RELATED -j ACCEPT # one cmd more efficient
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# drop all
iptables -P INPUT DROP
iptables -P OUTPUT DROP

## add same for forwarding, like in a previous exercise
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -s 192.168.13.0/24 -m state --state NEW -j ACCEPT
iptables -A FORWARD -d 192.168.13.0/24 -m state --state NEW -j ACCEPT # siamo sicuri di volerlo? potremmo voler fare nat
iptables -P FORWARD DROP
