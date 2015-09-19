#!/bin/sh

# install hostapd dnsmasq
sudo apt-get install hostapd dnsmasq

# copy config file to /etc/
sudo cp ./dnsmasq.conf /etc/
sudo cp ./hostapd.conf /etc/

# get DNS servers
sudo resolvconf -u
sudo cp /etc/resolv.conf /etc/dnsmasq.resolv.conf
