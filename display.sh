#!/bin/bash
PRIMARY_DISPLAY=$(xrandr | grep primary | awk '{print $1}')
case $(echo -e "Main\nMirror\nExtend"|dmenu -i -p "Display?") in 
  "Main") xrandr --output $PRIMARY_DISPLAY --mode 1920x1080 --panning 1920x1080* --primary --output HDMI2 --off && feh --bg-fill ~/Pictures/WP/w.jpg;;
    "Mirror") xrandr --output $PRIMARY_DISPLAY --mode 1920x1080 --fb 1920x1080 --panning 1920x1080* --primary --output HDMI2 --mode 1920x1080 --same-as $PRIMARY_DISPLAY && feh --bg-fill ~/Pictures/WP/w.jpg;;
    "Extend") xrandr --output $PRIMARY_DISPLAY  --mode 1920x1080 --primary --output HDMI2 --auto --right-of $PRIMARY_DISPLAY && feh --bg-fill ~/Pictures/WP/w.jpg;;
esac

