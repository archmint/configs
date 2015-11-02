#!/bin/sh

if [ "$(ps -e | grep screenkey)" ]; then
    pkill screenkey;
else
    screenkey --key-mode composed --mods-mode emacs -t 2 -p bottom --no-systray --persist --mods-mode emacs --opacity .27;
fi;
