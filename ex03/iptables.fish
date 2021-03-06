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

# log for ids
iptables -A INPUT -j LOG --log-prefix 'BAD INPUT LOG'
iptables -A FORWARD -i eth1 -s 192.168.13.0/24 -j LOG --log-prefix 'FORGERY FORWARD LOG' # -A???
iptables -A FORWARD -i eth1 -s 192.168.13.0/24 -j DROP
iptables -A FORWARD -j LOG --log-prefix 'BAD FORWARD LOG'
iptables -A OUTPUT -j LOG --log-prefix 'BAD OUTPUT LOG'

# port scanning ids, last exercise
iptables -I INPUT 2 -s 192.168.13.0/24 -m state --state NEW -j LOG --log-prefix 'GOOD INPUT LOG' # couple this with bad input

# anti dos: syn flood, last exercise rly
 iptables -I FORWARD 1 -d 172.16.254.100 -m state --state NEW,ESTABLISHED,RELATED -m limit --limit 20/s -j DROP
 iptables -I FORWARD 1 -d 172.16.254.200 -m state --state NEW -m limit --limit 2/s -j DROP
