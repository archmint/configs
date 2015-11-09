#!/bin/sh

command -v 'convert' > /dev/null 2&> /dev/null || (>&2 echo 'ERROR: install imagemagick (or its convert)'; exit 1;);

if [ ! "$1" ]; then
    >&2 echo "ERROR: you must pass in the name of the image you would like to convert";
    exit 2;
fi

size='1920x1080'

convert $1 -resize $size "${1%.*}.png"
