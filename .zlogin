if [ "$DISPLAY" ]; then
    setxkbmap -option 'caps:ctrl_modifier'
    xcape -e 'Caps_Lock=Escape'
fi

export PATH="$HOME/bin/:$PATH"
export EDITOR=vim
export TERMINAL=terminator

