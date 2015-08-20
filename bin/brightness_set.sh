#!/bin/sh

mbrt=$(cat /sys/class/backlight/intel_backlight/max_brightness);

brt=${1:-$(($mbrt/2))};

echo $brt > /sys/class/backlight/intel_backlight/brightness && echo $brt;

