#!/usr/bin/env sh

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload -c ~/.config/polybar/config.ini main &
done

# info bar only on laptop screen
MONITOR=eDP-1 polybar --reload -c ~/.config/polybar/config.ini info &
