#!/bin/bash

# Flushing all rules
iptables -F
iptables -X

# Setting default filter policy
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

# Allow unlimited traffic on loopback
iptables -A INPUT -i lo -j ACCEPT
#iptables -A OUTPUT -o lo -j ACCEPT

# blocking span
# iptables -A OUTPUT -p all --destination www.mydat.club -j DROP

# Allow response to previous request
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# iptables -A INPUT -p tcp --dport 22 -j ACCEPT

#log dropped packets

#iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix "[netfilter]" --log-level 7

iptables -N LOG_DROP
iptables -A LOG_DROP  -m limit --limit 5/m --limit-burst 10 -j LOG --log-prefix "[netfilter]"
iptables -A LOG_DROP -j DROP
iptables -A INPUT -m conntrack --ctstate INVALID -j LOG_DROP
