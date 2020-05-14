#!/bin/bash
export SUDO_ASKPASS="$HOME/Scripts/askpass.sh"
sudo -A iw wlp1s0 scan|grep SSID|awk '{print $2}'|tr -s "\n"|tr -s "\x00"|tr -s "\x0"|sort|uniq|dmenu|xargs -i x-terminal-emulator -e "echo 'enter pass:' && wpa_passphrase {}  | sudo -A tee -a /etc/wpa_supplicant/wpa_supplicant-wlp1s0.conf"
