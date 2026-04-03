#!/bin/sh

source $HOME/.config/polybar/scripts/colors.sh

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
    updates_aur=0
fi

updates=$((updates_arch + updates_aur))

if [ "$updates" -gt 0 ]; then
    echo "$dark0_soft [$faded_purple  $updates $dark0_soft] "
else
    echo ""
fi
