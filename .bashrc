## ~/.bashrc

## If not running interactively, don't do anything
[ -z "$PS1" ] && return


## Make Caps lock useful
### CAPS tap: <esc>
### CAPS hold: <C>
#if ! [ "$DISPLAY" = "" ]; then
#    setxkbmap -option 'caps:ctrl_modifier'
#    xcape -e 'Caps_Lock=Escape'
#fi


alias android='(~/android-studio/bin/studio.sh &)'

## ls options
alias ls='ls --color=auto --file-type'
alias la='ls -AF'
alias ll='ls -lAF'
#alias cls='clear; ls'
#alias cla='clear; la'
#alias cll='clear; ll'

## grep options -- CAN'T USE THESE because bash autocompletions get screwed up
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias vb='vim ~/.bashrc && source ~/.bashrc'
alias vv='vim ~/.vimrc'

## term initializations
if [ "$TERM" = "xterm" ] || [ "$TERM" = "screen-256color" ] || [ "$TERM" = "screen" ]; then
#    PS1="\[\e[0;1;34m\][$(date +%R)] \[\e[00;36m\]${debian_chroot:+($debian_chroot)}\u@\h\[\e[01;34m\]:\w\[\e[00m\] \$ "
#    PS1="\[\e[0;1;31;40m\]\t \[\e[0;30;47m\]\[\e[37;44m\]\[\e[1;37m\] ${debian_chroot:+($debian_chroot)}\u@\h \[\e[0;34;47m\]\[\e[37;40m\]\[\e[1;32m\] \w \[\e[0;30;49m\]\[\e[00m\] "
    PS1="\[\e[0m\]\e[K\n\[\e[1;31;44m\]┌\[\e[1;37m\] \t \[\e[0;34;48m\]\e[K\n\[\e[1;31;44m\]└\[\e[1;37;44m\] ${debian_chroot:+($debian_chroot)}\u@\h \[\e[0;34;47m\]\[\e[37;40m\]\[\e[1;32m\] \w \[\e[0;30;49m\]\[\e[00m\] "
else
#    PS1="\[\e[0;1;36m\][\$(date +%R)] \[\e[00;01;32m\]${debian_chroot:+($debian_chroot)}\u@\h\[\e[01;36m\]:\w\[\e[01;32m\] \$ "
#    PS1="\[\e[0;1;33;44m\][\t] \[\e[0;34;46m\]>\[\e[1;37m\] ${debian_chroot:+($debian_chroot)}\u@\h:\w \[\e[0;36;49m\]>\[\e[00m\] "
    PS1="\[\e[0m\]\e[K\n\[\e[1;31;44m\]/\[\e[1;37m\]\t \[\e[0;34;48m\]>\e[K\n\[\e[1;31;44m\]\\ \[\e[1;37;44m\]${debian_chroot:+($debian_chroot)}\u@\h \[\e[0;34;47m\]>\[\e[37;40m\]>\[\e[1;32m\] \w \[\e[0;30;49m\]>\[\e[00m\] "
fi

## hard screen clear
bind -x '"\C-t": printf "\ec"'

## brightness in terminal  (for the most part, you don't need these)
#bind -x '"\C-k": brightness_up.sh'
#bind -x '"\C-j": brightness_down.sh'
#bind -x '"\C-l": brightness_set.sh'
#bind -x '"\C-h": brightness_set.sh 0'

## uncomment the next line if not using solarized built-in colorscheme (in terminator, for example)
#eval `dircolors ~/git/dircolors-solarized/dircolors.ansi-light'

## for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

## append to the history file, don't overwrite it
shopt -s histappend

## make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

## alerts
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias emergency='notify-send --urgency=critical -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

## android - move android-studio to home before setup and uncomment next line
#alias android='(~/android-studio/bin/studio.sh &> /dev/null &)'

## float division
float() {
    ## This will print (first arg)/(second arg) up to (third arg) decimal places
    if [ ! $3 ]; then # no third arg
        places=0;
    else
        places=$3;
    fi
    if [ ! $2 ]; then
        printf "\e[31;1mMust pass at least two numbers to divide\e[0m\n";
    fi
    echo `awk "BEGIN {printf \"%.${places}f\", ${1}/${2}}"`
}

## fun/crazy things
pwdzip() {
    read -sp 'password: ' ispwd;
    echo; 7zr -p $ispwd $1 $2;
    ispwd=00000000; ## write over insecure password
    unset ispwd; ## unset insecure password
    echo done;
}

spell() {
    out="$*"
    if [ -f $out 2> /dev/null ]; then
        out="$(cat $out)"
    fi
    while test -n "$out"; do
        c=${out:0:1};
        out=${out:1};
        printf "$c";
        if [ "$c" != "" ]; then
            if [ "$c" = " " ]; then
                sleep .02;
            else
                sleep .045;
            fi
        fi
    done;
    echo;
}

alias da='spell "cDid somebody say real power?

    Дa, you want to mess with me?
    I spit hot borscht when I'"'"'m crushing these beats.

    Blow it up like a tuba, while I'"'"'m balling in Cuba,
    Doing judo moves and schooling every communist сука.

    I'"'"'m a president in my prime. My enemies don'"'"'t distract me.
    The last man who attacked me lived a half-life, so comrade, come at me!

    You don'"'"'t know what you'"'"'re doing when you try to bust a rhyme against a mind like Putin!
    You'"'"'ll find that the KGB is the best mc in the ex CCCP."'

    alias pandora='{ echo -e "$(cat ~/.musik/name)\n$(cat ~/.musik/pass | base64 --decode)"; cat; } | pianobar'
    alias pandora_setup='mkdir -p ~/.musik; chmod 300 ~/.musik; if [ -f ~/.musik/pass ]; then chmod 300 ~/.musik/pass; fi; read -p "username: " name; echo $name > ~/.musik/name; read -p "password: " -s pass; echo $pass | base64 > ~/.musik/pass; chmod 400 ~/.musik/pass; printf "\n\n\e[34;1mYou are ready to go. Just type \"pandora\"\n";'

