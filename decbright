#!/bin/bash

BRIGHT=$(cat /sys/class/backlight/intel_backlight/brightness)
MAXBRIGHT=$(cat /sys/class/backlight/intel_backlight/max_brightness)

cd /sys/class/backlight/intel_backlight/

brightnumber=$(< brightness)
maxbrightnumber=$(< max_brightness)
step=10

if [ "$brightnumber" -ge 11 ] ; then
brightnumber=$(($brightnumber-$step))
echo "$brightnumber" > /sys/class/backlight/intel_backlight/brightness
else
echo 0 > /sys/class/backlight/intel_backlight/brightness
fi
