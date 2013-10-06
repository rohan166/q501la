q501la
======

Make fn keys on ASUS Q501LA work on Linux

So I bought an ASUS Q501LA with preinstalled Windows 8 and installed Debian on it.
The immediate result was that the fn keys didn't work even after updating the kernel, except for the fn + volume keys.


The fn keys are read only on kernels 3.4 and newer
The following have been tested and are working on 3.10

NOTE : fn + F5 and fn + F6 are not recognized by the kernel, you can test this by executing xev and pressing the combination.
Alternative keybinds must be used.

## SCREEN BRIGHTNESS

Files:
1. decbright.sh
2. incbright.sh

incbright.sh increases the brightness of the screen by 10.
decbright.sh decreases the brightness of the screen by 10.
Edit the step variable in the scripts to increment/decrement differently.

Since gnome-power-manager and xfce's power manager couldn't change the screen brightness, I made some scripts of my own.

By default, the brightness file for the screen is located at /sys/class/backlight/intel_backlight/

For the scripts to work, you must have rw permissions for brightness and max_brightness files.
Then you can keybind your preferred keys to execute the script.

Obtain ownership of the files by adding the following lines to /etc/rc.local : 


chown -R USERNAME /sys/class/backlight/intel_backlight/

Make sure the last line of the file is "exit 0" without the quotes.



## KEYBOARD BACKLIGHT BRIGHTNESS

Files:
1. deckbd.sh
2. inckbd.sh

inckbd.sh increases the brightness of the keyboard's backlight by one unit.
deckbd.sh decreases the brightness of the keyboard's backlight by one unit.

Since the maximum value for brightness is 3, and the minimum is 0, increment/decrement by one unit is optimal.

By default, the brightness file for the keyboard's backlight is located at /sys/class/leds/asus::kbd_backlight/

For the scripts to work, you must have rw permissions for brightness and max_brightness files.
Then you can keybind your preferred keys to execute the script. In this case, the fn keys are recognized by the kernel.

The Fn combination for decreasing keyboard backlight is represented as : XF86KbdBrightnessDown
The Fn combination for increasing keyboard backlight is represented as : XF86KbdBrightnessUp

Obtain ownership of the files by adding the following lines to /etc/rc.local

chown -R USERNAME /sys/class/leds/asus::kbd_backlight/

Make sure the last line of the file is "exit 0" without the quotes.



## TOGGLE TOUCHPAD

Files:
1. toggleTouch.sh

toggleTouch.sh toggles the touchpad on and off.

No special permissions are required for the script to work. The fn combination for this is recognized by the kernel
and is represented as : XF86TouchpadToggle
