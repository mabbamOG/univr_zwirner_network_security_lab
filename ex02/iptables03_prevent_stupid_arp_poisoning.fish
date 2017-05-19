# add to the top of the chain (to avoid being skipped) that drop packet iff:
# 1. the packet is from a known host inside the subnet
# 2. the mac address (as it is known) is not correct
iptables -I INPUT 1 -s 192.168.13.1 -m mac ! --mac-source B8:88:E3:8E:94:8E -j DROP
