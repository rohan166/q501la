#!/bin/bash

BRIGHT=$(cat /sys/class/leds/asus::kbd_backlight/brightness)
MAXBRIGHT=$(cat /sys/class/leds/asus::kbd_backlight/max_brightness)

cd /sys/class/leds/asus::kbd_backlight/

brightnumber=$(< brightness)
maxbrightnumber=$(< max_brightness)
step=1
limit=$(($maxbrightnumber - step))

if [ "$brightnumber" -le "$limit" ] ; then
brightnumber=$(($brightnumber+$step))
echo "$brightnumber" > brightness
else
echo "$maxbrightnumber" > brightness
fi
