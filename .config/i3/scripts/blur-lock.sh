#!/bin/bash

PICTURE=/tmp/i3lock.png
LOCK=~/.config/i3/scripts/lock.png

scrot -z $PICTURE
magick $PICTURE -scale 5% -scale 2000% $LOCK -gravity center -composite -matte $PICTURE
i3lock -u -i $PICTURE
rm $PICTURE
