#!/bin/bash
if [ "$1" -eq "1" ]; then
    xbacklight -inc 5
elif [ "$1" -eq "0" ]; then
    xbacklight -dec 5
fi
NEWB_RATE=$(xbacklight -get|xargs printf "%.0f")
NOTI_ID=$(notify-send.py "BRIGHTNESS" \
                         --hint string:image-path:video-display int:value:$NEWB_RATE \
                         --replaces-process "brightness-popup")
