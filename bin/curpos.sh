#!/bin/sh

exec < /dev/tty
oldstty=$(stty -g)
stty raw -echo min 0
echo -en "\033[6n" > /dev/tty
IFS=';' read -r -d R -a pos
stty $oldstty
row=$((${pos[0]:2} - 1))    # strip off the esc-[
col=$((${pos[1]} - 1))

echo $col $row
