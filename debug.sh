#!/bin/bash

echo "Check if debug file is present"
if test -d "/boot/OpenHD/debug"; then
    cd /boot/OpenHD/debug
    echo "export journalctl"
    echo "Wait 2min until everything is started"
    sleep 2m
    sudo journalctl >> journal.debug
    echo "export service list"
    sudo systemctl list-units --type=service >> services.debug
    echo "export usb-devices"
    sudo lsusb >> usb.debug
    echo "export video-devices"
    sudo ls -ltrh /dev/video* >> video.debug
    echo "export rtl8812au"
    sudo modinfo 88XXau_wfb >> wifi.debug
    sudo iwconfig wlan0 >> wifi.debug
    sudo iwconfig wlan1 >> wifi.debug
    echo "export dev"
    sudo ls /dev >> dev.debug
    sudo ifconfig >> dev.debug

fi

