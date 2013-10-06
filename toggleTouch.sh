#! /bin/bash

input=$(synclient | grep TouchpadOff)
length=${#input}
toggle=${input:$length-1}

if [ "$toggle" -eq 0 ] ; then
   synclient TouchpadOff=1 
else
   synclient TouchpadOff=0
fi
