# if [ "$DISPLAY" ] && [ ! "$(ps -e | grep xcape)" ]; then
#     setxkbmap -option 'caps:ctrl_modifier'
#     xcape -e 'Caps_Lock=Escape'
# fi

export PATH="$HOME/scripts/:$PATH"
export EDITOR=vim
export BROWSER=firefox-nightly
# export TERMINAL=terminator
export TERMINAL=/usr/bin/termite

