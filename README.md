q501la
======

Make fn keys on ASUS Q501LA work on Linux

So I bought an ASUS Q501LA with preinstalled Windows 8 and installed Debian on it.
The immediate result was that the fn keys didn't work even after updating the kernel, except for the fn + volume keys.

Since gnome-power-manager and xfce's power manager couldn't change the screen brightness, I made some scripts of my own.

By default, the brightness file for the backlight is located at /sys/class/backlight/intel_backlight/brightness

For the scripts to work, you must have rw permissions for brightness and max_brightness files.
Then you can keybind your preferred keys to execute the scripts.

The fn keys are read only on kernels 3.4 and newer
The following has been tested and is working on 3.10

NOTE : fn + F5 and fn + F6 are not read by the kernel, you can test this by executing xev and pressing the combination.
Alternative keybinds must be used.

## BRIGHTNESS

incbright increases the brightness by 10 and decbright decreases it by 10.
Edit the step variable in the scripts to increment/decrement differently.

Obtain ownership of the files by adding the following lines to /etc/rc.local : 


chown USERNAME /sys/class/backlight/intel_backlight/brightness
chown USERNAME /sys/class/backlight/intel_backlight/max_brightness

Make sure these two lines are followed by "exit 0" without the quotes.
