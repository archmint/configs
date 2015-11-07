#!/bin/sh

brt=$(cat /sys/class/backlight/intel_backlight/brightness);
mbrt=$(cat /sys/class/backlight/intel_backlight/max_brightness);

incr=${1:-10};

let brt+=$incr;

if [ $brt -gt $mbrt ]; then
    brt=$mbrt;
fi

echo $brt > /sys/class/backlight/intel_backlight/brightness && echo $brt;

