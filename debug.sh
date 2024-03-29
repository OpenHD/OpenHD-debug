#!/bin/bash

echo "Check if debug file is present"
until ! [ -d /boot/OpenHD/debug ]
do
    cd /boot/OpenHD/debug
    echo "export journalctl"
    sudo journalctl > journal.debug
    echo "export service list"
    sudo systemctl list-units --type=service > services.debug
    echo "export usb-devices"
    sudo lsusb > usb.debug
    echo "export video-devices"
    sudo ls -ltrh /dev/video* > video.debug
    echo "export rtl8812au"
    sudo modinfo 88XXau_wfb > wifi-au.debug
    sudo modinfo 88XXbu > wifi-bu.debug
    sudo iwconfig wlan0 > wlan0.debug
    sudo iwconfig wlan1 > wlan1.debug
    echo "export dev"
    sudo ls /dev > dev.debug
    sudo ifconfig > ifconfig.debug
    echo "Wait 2min for the next print everything is started"
    sleep 2m
done
