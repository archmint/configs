#!/bin/sh

brt=$(cat /sys/class/backlight/intel_backlight/brightness);

incr=${1:-10};

let brt-=$incr;

if [ $brt -lt 0 ]; then
    brt=0;
fi

echo $brt > /sys/class/backlight/intel_backlight/brightness && echo $brt;

