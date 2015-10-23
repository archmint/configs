#!/bin/sh

printf "\e[40m   ";
for i in {0..7}; do
    j=$((i+1))
    printf "\e[3${i};4${j}m ";
done;
printf "  \e[30mhow's it look?   ";
for i in {8..1}; do
    j=$((i-1))
    printf "\e[3${j};4${i}m ";
done;
printf "\e[40m   ";
echo;
