#!/bin/bash
export SUDO_ASKPASS="$HOME/Scripts/askpass.sh"
SSID=$(sudo -A iw wlp1s0 scan|grep SSID|awk '{print $2}'|tr -s "\n"|sort|uniq|rofi -dmenu -only-match) && PASS=$(zenity --entry --text "Pass key for SSID: $SSID") && wpa_passphrase $SSID $PASS | sudo -A tee -a /etc/wpa_supplicant/wpa_supplicant-wlp1s0.conf
