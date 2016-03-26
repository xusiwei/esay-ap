#!/bin/sh

#nmcli是NetworkManager的命令行版
#sudo nmcli nm wifi off  # Ubuntu 14.04
sudo nmcli radio wifi off # Debian
sudo rfkill unblock wlan
