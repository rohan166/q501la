#!/bin/bash

BRIGHT=$(cat /sys/class/backlight/intel_backlight/brightness)
MAXBRIGHT=$(cat /sys/class/backlight/intel_backlight/max_brightness)

cd /sys/class/backlight/intel_backlight/

brightnumber=$(< brightness)
maxbrightnumber=$(< max_brightness)
step=10
limit=$(($maxbrightnumber - step))

if [ "$brightnumber" -le "$limit" ] ; then
brightnumber=$(($brightnumber+$step))
echo "$brightnumber" > /sys/class/backlight/intel_backlight/brightness
else
echo "$maxbrightnumber" > /sys/class/backlight/intel_backlight/brightness
fi
