#!/usr/bin/bash

#Next time use firewalld xD

iptables-save
iptables -N TCP
iptables -N UDP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -P INPUT DROP
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP
iptables -A INPUT -p icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT
iptables -A INPUT -p udp -m conntrack --ctstate NEW -j UDP
iptables -A INPUT -p tcp --syn -m conntrack --ctstate NEW -j TCP
iptables -A INPUT -p udp -j REJECT --reject-with icmp-port-unreachable
iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset
iptables -A INPUT -j REJECT --reject-with icmp-proto-unreachable
iptables -A TCP -p tcp --dport 22 -j ACCEPT #SSH Server
# iptables -A TCP -p tcp --dport 80 -j ACCEPT #HTTP Server
# iptables -A TCP -p tcp --dport 443 -j ACCEPT #HTTPS Server
iptables-save -f /etc/iptables/iptables.rules

ip6tables-save
ip6tables -N TCP
ip6tables -N UDP
ip6tables -P FORWARD DROP
ip6tables -P OUTPUT ACCEPT
ip6tables -P INPUT DROP
ip6tables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
ip6tables -A INPUT -i lo -j ACCEPT
ip6tables -A INPUT -m conntrack --ctstate INVALID -j DROP
ip6tables -A INPUT -s fe80::/10 -p ipv6-icmp -j ACCEPT
ip6tables -A INPUT -p ipv6-icmp --icmpv6-type 128 -m conntrack --ctstate NEW -j ACCEPT
ip6tables -A INPUT -p udp -m conntrack --ctstate NEW -j UDP
ip6tables -A INPUT -p tcp --syn -m conntrack --ctstate NEW -j TCP
ip6tables -A INPUT -p udp -j REJECT
ip6tables -A INPUT -p tcp -j REJECT --reject-with tcp-reset
ip6tables -A INPUT -j REJECT
ip6tables -A TCP -p tcp --dport 22 -j ACCEPT #SSH Server
# ip6tables -A TCP -p tcp --dport 80 -j ACCEPT #HTTP Server
# ip6tables -A TCP -p tcp --dport 443 -j ACCEPT #HTTPS Server
ip6tables -A INPUT -p udp --sport 547 --dport 546 -j ACCEPT
ip6tables -t raw -A PREROUTING -m rpfilter -j ACCEPT
ip6tables -t raw -A PREROUTING -j DROP
ip6tables-save -f /etc/iptables/ip6tables.rules






