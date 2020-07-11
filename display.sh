#!/bin/bash
case $(echo -e "Main\nMirror\nExtend"|dmenu -i -p "Display?") in 
    "Main") xrandr --output eDP1 --mode 1920x1080 --panning 1920x1080* --primary --output HDMI2 --off && feh --bg-fill ~/Pictures/WP/w.jpg;;
    "Mirror") xrandr --output eDP1 --mode 1920x1080 --fb 1920x1080 --panning 1920x1080* --primary --output HDMI2 --mode 1920x1080 --same-as eDP1 && feh --bg-fill ~/Pictures/WP/w.jpg;;
    "Extend") xrandr --output eDP1 --mode 1600x900 --primary --output HDMI2 --auto --right-of eDP1 && feh --bg-fill ~/Pictures/WP/w.jpg;;
esac

