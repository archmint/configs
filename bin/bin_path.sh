#!/bin/sh

# PUT THE ~/bin IN $PATH

if [[ $(cat "$HOME/.bash_profile" | grep 'export PATH="$HOME/bin/:$PATH"') ]]; then
    echo -e "\n\n$HOME/bin/has already been added to your path :)";
else
    echo 'export PATH="$HOME/bin/:$PATH"' >> $HOME/.bash_profile;
    if [ $? -eq 0 ]; then
        echo -e "\n\n$HOME/bin/ has been added to your path. Please log out and log back in for the changes to take effect. :D";
    else
        echo -e "\n\nThere was an error adding $HOME/bin/ to your path. :(";
    fi;
fi;

