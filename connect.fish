sudo ip addr add 192.168.13.1 dev enp2s0
#sudo ip route add 192.168.13.0/24 via 192.168.13.254
sudo ip route change default via 192.168.13.254 dev enp2s0
echo  (cat /etc/hosts | cut -f 2 | sed -r '/^[#<]|^$/d')
