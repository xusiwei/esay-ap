#!/bin/sh

sudo /etc/init.d/dnsmasq stop

sudo killall named
sudo killall hostapd
sudo killall dnsmasq

# setup wlan0 IP address
sudo ifconfig wlan0 192.16.1.1

# turn on ipv4 forward, umcomment net.ipv4.ip_forward=1 in /etc/sysctl.conf as a boot-up argument
sudo echo '1'>/proc/sys/net/ipv4/ip_forward

# backup DNS settings
#sudo cp /etc/resolv.conf /etc/dnsmasq.resolv.conf

# restart DHCP server
sudo /etc/init.d/dnsmasq restart

# restore DNS settings(because dnsmasq service set nameserver as localhost).
#sudo cp /etc/dnsmasq.resolv.conf /etc/resolv.conf

# start access point
sudo hostapd -B /etc/hostapd.conf

#setup ip forward rules
sudo ./setIptables.sh 
