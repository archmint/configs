#!/bin/sh

if [[ "$(synclient -l | grep 'TouchpadOff' | grep '0')" == "" ]]; then # touchpadd off
    synclient TouchpadOff=0
    echo touchpad turned on;
else
    synclient TouchpadOff=1
    echo touchpad turned off;
fi

