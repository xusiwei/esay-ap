#!/bin/sh

#nmcli是NetworkManager的命令行版
sudo nmcli nm wifi off
sudo rfkill unblock wlan
