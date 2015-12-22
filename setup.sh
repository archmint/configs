#!/bin/bash

CURDIR="$(dirname $(readlink -f $0))";
LINKS=(.vimrc .vim .zshrc .bashrc .i3 .backgrounds .i3status .irssi .tmux.conf .profile .i3blocks.conf .idlerc);

cd $HOME;

echo -e "OPTIONS: y=yes n=no e=exit (CAPITALIZED is \033[1mdefault\033[0m)\n";
for LINK in $(ls -A ${CURDIR}/dotfiles); do
    if [[ -e ${HOME}/${LINK} ]]; then # ALREADY a file/dir!
        if [[ "$(dirname $(readlink -f ${HOME}/${LINK}))" = "$CURDIR/dotfiles" ]]; then
            printf "\033[32;1mO\033[0m \033[32;1m${HOME}/$LINK\033[0m already linked\n";
        else
            printf "  \033[31;1m${HOME}/${LINK}\033[0m is alread a file"'!'" OK to overwrite? [y/N/e] ";
            read -n1 resp;
            if [[ -n $resp ]]; then
                printf "\n";
            elif [[ "$resp" = "e" ]] || [[ "$resp" = "E" ]]; then
                exit 1;
            elif [[ "$resp" != "y" ]] && [[ "$resp" != "Y" ]]; then
                printf "\033[0A\033[31;1mX\033[0m\n";
                continue;
            fi;
            rm -rf ${HOME}/${LINK};
            ln -s ${CURDIR}/dotfiles/${LINK};
            printf "\033[0A\033[32;1mO\033[0m\n";
        fi;
    else
        printf "  \033[33;1m${HOME}/${LINK}\033[0m not linked yet. Link? [Y/n/e] "
        read -n1 resp;
        if [[ -n $resp ]]; then
            printf "\n";
        elif [[ "$resp" = "e" ]] || [[ "$resp" = "E" ]]; then
            exit 1;
        elif [[ "$resp" == "n" ]] || [[ "$resp" == "N" ]]; then
            printf "\033[0A\033[31;1mX\033[0m\n";
            continue;
        fi;
        ln -s ${CURDIR}/dotfiles/${LINK};
        printf "\033[0A\033[32;1mO\033[0m\n";
    fi;
done

cd - >/dev/null 2&>1;

