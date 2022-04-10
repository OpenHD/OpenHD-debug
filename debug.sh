#!/bin/bash

echo "Check if debug file is present"
if test -f "/conf/boot/debugFile"; then
cd /conf/boot/
mkdir debug
cd debug
echo "export journalctl"
echo "Wait 2min until everything is started"
sleep 2m
sudo journalctl >> journal.debug
echo "export service list"
sudo systemctl list-units --type=service >> services.debug
echo "export usb-devices"
sudo lsusb >> usb.debug
echo "export rtl8812au"
sudo modinfo 88XXau >> rtl8812au.debug
sudo iwconfig wlan0 >> rtl8812au.debug
echo "export dev"
sudo ls /dev >> dev.debug
sudo ifconfig >> dev.debug


fi

