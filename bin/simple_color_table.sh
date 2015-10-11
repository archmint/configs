#!/bin/sh

printf "      ";
for i in {0..8}; do
    printf "\x1b[4${i}m        \x1b[0m  ";
done;

printf "\n";

for i in {0..8}; do
    printf "\x1b[3${i}m==\x1b[1m==  ";
    for j in {0..8}; do
        printf "\x1b[3${i}m\x1b[4${j}mTEST \x1b[1mTEST\x1b[0m ";
    done;
    printf "\n";
done
