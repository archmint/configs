## ~/.bashrc

## If not running interactively, don't do anything
[ -z "$PS1" ] && return

## ls options
alias ls='ls --color=auto --file-type'
alias la='ls -AF'
alias ll='ls -lAF'
#alias cls='clear; ls'
#alias cla='clear; la'
#alias cll='clear; ll'


## grep options
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

## quick aliases
alias tm='tmux -2'
alias vb='vim ~/.bashrc; source ~/.bashrc;'
alias vz='vim ~/.zshrc; source ~/.zshrc'
alias vv='vim ~/.vim/vimrc;'
alias vnv='vim ~/.config/nvim/init.vim'
alias vt='vim ~/.tmux.conf'
alias vi3='vim ~/.i3/config'
alias vi3s='vim ~/.i3status.conf'


## hard screen clear
bind -x '"\C-t": printf "\ec"'


## PS1
if [ "$TERM" = "xterm" ] || [ "$TERM" = "screen-256color" ] || [ "$TERM" = "screen" ]; then
#    PS1="\[\e[0;1;34m\][$(date +%R)] \[\e[00;36m\]${debian_chroot:+($debian_chroot)}\u@\h\[\e[01;34m\]:\w\[\e[00m\] \$ "
#    PS1="\[\e[0;1;31;40m\]\t \[\e[0;30;47m\]\[\e[37;44m\]\[\e[1;37m\] ${debian_chroot:+($debian_chroot)}\u@\h \[\e[0;34;47m\]\[\e[37;40m\]\[\e[1;32m\] \w \[\e[0;30;49m\]\[\e[00m\] "
    PS1="\[\e[0m\]\e[K\n\[\e[1;31;44m\]┌\[\e[1;37m\] \t \[\e[0;34;48m\]\e[K\n\[\e[1;31;44m\]└\[\e[1;37;44m\] ${debian_chroot:+($debian_chroot)}\u@\h \[\e[0;34;47m\]\[\e[37;40m\]\[\e[1;32m\] \w \[\e[0;30;49m\]\[\e[00m\] "
else
#    PS1="\[\e[0;1;36m\][\$(date +%R)] \[\e[00;01;32m\]${debian_chroot:+($debian_chroot)}\u@\h\[\e[01;36m\]:\w\[\e[01;32m\] \$ "
#    PS1="\[\e[0;1;33;44m\][\t] \[\e[0;34;46m\]>\[\e[1;37m\] ${debian_chroot:+($debian_chroot)}\u@\h:\w \[\e[0;36;49m\]>\[\e[00m\] "
    PS1="\[\e[0m\]\e[K\n\[\e[1;31;44m\]| \[\e[1;37m\]\t \[\e[31m\]>\[\e[0;34;48m\]\e[K\n\[\e[1;31;44m\]| \[\e[1;37;44m\]${debian_chroot:+($debian_chroot)}\u@\h \[\e[31m\]>\[\e[0;1;32m\] \w \[\e[31m\]>\[\e[00m\] "
fi

## for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

## append to the history file, don't overwrite it
shopt -s histappend

## make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


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

