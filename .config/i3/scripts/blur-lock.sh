#!/bin/bash

PICTURE=/tmp/i3lock.png
LOCK=~/.config/i3/scripts/lock.png

scrot $PICTURE
magick $PICTURE -scale 5% -scale 2000% $PICTURE
magick $PICTURE $LOCK -gravity center -composite -matte $PICTURE
i3lock -u -i $PICTURE
rm $PICTURE
