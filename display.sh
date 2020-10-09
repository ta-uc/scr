#!/bin/bash
PRIMARY_DISPLAY=$(xrandr | grep primary | awk '{print $1}')
SECONDARY_DISPLAY=$(xrandr | grep " connected" | grep -v "primary" | awk '{print $1}')
case $(echo -e "Main\nMirror\nExtend"|dmenu -i -p "Display?") in 
    "Main") xrandr --output $PRIMARY_DISPLAY --mode 1920x1080 --panning 1920x1080* --primary --output $SECONDARY_DISPLAY --off && feh --bg-fill $WP;;
    "Mirror") xrandr --output $PRIMARY_DISPLAY --mode 1920x1080 --fb 1920x1080 --panning 1920x1080* --primary --output $SECONDARY_DISPLAY --mode 1920x1080 --same-as $PRIMARY_DISPLAY && feh --bg-fill $WP;;
    "Extend") xrandr --output $PRIMARY_DISPLAY --mode 1920x1080 --primary --output $SECONDARY_DISPLAY --auto --right-of $PRIMARY_DISPLAY && feh --bg-fill $WP
esac

