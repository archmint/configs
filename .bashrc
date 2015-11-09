## ~/.bashrc

## If not running interactively, don't do anything
[ -z "$PS1" ] && return

## General settings
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# ignore duplicate entries (and lines starting with space)
export HISTCONTROL=ignoreboth:erasedups

# don't echo ^C to terminal on ctrl+c
stty -ctlecho


## Key Bindings
# tab
bind 'set show-all-if-ambiguous on'
bind '"\C-i" menu-complete'

# hard screen clear
bind -x '"\C-t": printf "\ec"'


## Aliases
# ls options
alias ls='ls --color=auto --file-type'
alias la='ls -AF'
alias ll='ls -lAF'

# grep options
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# quick aliases
alias tm='tmux -2'
alias vb='vim ~/.bashrc; source ~/.bashrc;'
alias vz='vim ~/.zshrc; source ~/.zshrc'
alias vv='vim ~/.vimrc;'
alias vnv='vim ~/.config/nvim/init.vim'
alias vt='vim ~/.tmux.conf'
alias vi3='vim ~/.i3/config'
alias vi3s='vim ~/.i3status.conf'


## Colors



## GRML
# grml battery?
GRML_DISPLAY_BATTERY=1

# battery dir
if [ -d /sys/class/power_supply/BAT0 ]; then
    _PS1_bat_dir='BAT0';
else
    _PS1_bat_dir='BAT1';
fi

# ps1 return and battery
_PS1_ret(){
    # should be at beg of line (otherwise more complex stuff needed)
    RET=$?;

    # battery
    if [[ "$GRML_DISPLAY_BATTERY" == "1" ]]; then
        if [ -d /sys/class/power_supply/$_PS1_bat_dir ]; then
            # linux
            STATUS="$( cat /sys/class/power_supply/$_PS1_bat_dir/status )";
            if [ "$STATUS" = "Discharging" ]; then
                bat=$( printf ' v%d%%' "$( cat /sys/class/power_supply/$_PS1_bat_dir/capacity )" );
            elif [ "$STATUS" = "Charging" ]; then
                bat=$( printf ' ^%d%%' "$( cat /sys/class/power_supply/$_PS1_bat_dir/capacity )" );
            elif [ "$STATUS" = "Full" ] || [ "$STATUS" = "Unknown" ] && [ "$(cat /sys/class/power_supply/$_PS1_bat_dir/capacity)" -gt "98" ]; then
                bat=$( printf ' =%d%%' "$( cat /sys/class/power_supply/$_PS1_bat_dir/capacity )" );
            else
                bat=$( printf ' ?%d%%' "$( cat /sys/class/power_supply/$_PS1_bat_dir/capacity )" );
            fi;
        fi
    fi

    if [[ "$RET" -ne "0" ]]; then
        printf '\001%*s%s\r%s\002%s ' "$(tput cols)" ":( $bat " "[0;31;1m" "$RET"
    else
        printf '\001%*s%s\r\002' "$(tput cols)" "$bat "
    fi;
}

# ps1 git branch
_PS1_git(){
    if ! type 'git' &> /dev/null; then
        return 1;
    fi;
    if [ ! "$( git rev-parse --is-inside-git-dir 2> /dev/null )" ]; then
        return 2;
    fi
    branch="$( git symbolic-ref --short -q HEAD 2> /dev/null )"

    if [ "$branch" ]; then
        printf ' \001%s\002(\001%s\002git\001%s\002)\001%s\002-\001%s\002[\001%s\002%s\001%s\002]\001%s\002' "[0;35m" "[39m" "[35m" "[39m" "[35m" "[32m" "${branch}" "[35m" "[39m"
    fi;
}

# grml PS1 string
PS1="\n\[\e[F\e[0m\]\$(_PS1_ret)\[\e[34;1m\]${debian_chroot:+($debian_chroot)}\u\[\e[0m\]@\h \[\e[01m\]\w\$(_PS1_git) \[\e[0m\]% "

# my weirdo fancy schmancy PS1
# PS1="\[\e[0m\]\e[K\e[31m\${?##0}\n\[\e[1;31;44m\]┌\[\e[1;37m\] \t \[\e[0;34;48m\]\e[K\n\[\e[1;31;44m\]└\[\e[1;37;44m\] ${debian_chroot:+($debian_chroot)}\u@\h \[\e[0;34;47m\]\[\e[37;40m\]\[\e[1;32m\] \w \[\e[0;30;49m\]\[\e[00m\] "

