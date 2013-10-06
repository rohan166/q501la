#!/bin/bash

cd /sys/class/leds/asus::kbd_backlight/

BRIGHT=$(cat brightness)
MAXBRIGHT=$(cat max_brightness)

brightnumber=$(< brightness)
maxbrightnumber=$(< max_brightness)
step=1

if [ "$brightnumber" -ge 11 ] ; then
brightnumber=$(($brightnumber-$step))
echo "$brightnumber" > brightness
else
echo 0 > brightness
fi
