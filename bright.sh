#!/bin/bash
cb=`cat /sys/class/backlight/intel_backlight/brightness`
if [ "$1" -eq "1" ];
then
    newb=`expr $cb + 85`
    echo $newb | sudo tee /sys/class/backlight/intel_backlight/brightness
elif [ "$1" -eq "0" ];
then
    newb=`expr $cb - 85`
    echo $newb | sudo tee /sys/class/backlight/intel_backlight/brightness
fi
notify-send -t 100 $(($newb *100/7585))
#cat /sys/class/backlight/intel_backlight/brightness
