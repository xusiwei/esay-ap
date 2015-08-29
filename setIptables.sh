#!/bin/sh
# add routes

# Delete all rules in  chain or all chains
iptables -F

# Delete a user-defined chain
iptables -X

# table to manipulate (default: `filter')
iptables -t nat -F
iptables -t nat -X
iptables -t nat -APOSTROUTING -s 192.16.1.0/24 -o eth0 -jMASQUERADE

# Append to chain
iptables -A FORWARD -s 192.16.1.0/24 -o eth0 -jACCEPT
iptables -A FORWARD -d 192.16.1.0/24 -m conntrack --ctstate ESTABLISHED,RELATED -i eth0 -jACCEPT
