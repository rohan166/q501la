#!/bin/bash

# Make the directory containing $MAXBRIGHT and $BRIGHT your working
# directory

# brightness contains the current brightness level.
# Changing its value changes the brightness of the screen.
# maxbrightness contains the maximum possible brightness level.

cd /sys/class/backlight/intel_backlight/

brightnumber=$(< brightness)
maxbrightnumber=$(< max_brightness)
step=10

# step is the smallest possible incrememnt/decrement.
# It's set to 10 by default

if [ "$brightnumber" -ge 11 ] ; then
brightnumber=$(($brightnumber-$step))
echo "$brightnumber" > /sys/class/backlight/intel_backlight/brightness
else
echo 0 > /sys/class/backlight/intel_backlight/brightness
fi
