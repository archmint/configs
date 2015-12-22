# configs and more #
--

## Within this repository are configuration files for the following ##
- .backgrounds/        - background images
- .bashrc              - bash profile (sourced for new bash shell)
- compton.conf         - compton configuration file
- .i3status.conf       - i3status configuration file
- .bash_profile        - bash profile (sourced on login -- not every new bash shell)
- .i3/                 - i3-wm configuration directory
- .idlerc/             - solarized idle profile
- .keymap_caps2esc     - use `setxkbmap` to map caps to escape
- .profile             - simple configuration profile that should be sourced
- .tmux.conf           - tmux configuration
- .vim/                - vim configuration directory
- .vimrc               - vim profile (sourced when vim is started)
- .zshrc               - zsh profile (sourced for new zsh shell)
- nvim/                - neovim configuration directory
- scripts/             - fun and useful scripts
- terminator/          - terminator configuration directory
- terminator-configs/  - lots of terminator schemes and color schemes

## Places to put the configs ##
- .backgrounds/
    * `ln -s` to "$HOME/.backgrounds/"
- .bashrc
    * `ln -s` to "$HOME/.bashrc"
- compton.conf
    * `ln -s` to "$HOME/.config/compton.conf"
- .i3status.conf
    * `ln -s` to "$HOME/.i3status.conf"
- .bash_profile
    * `ln -s` to "$HOME/.bash_profile"
- .i3/
    * `ln -s` to "$HOME/.i3/"
- .idlerc/
    * `ln -s` to "$HOME/.idlerc/"
- .keymap_caps2esc
    * N/A
- .profile
    * `ln -s` to "$HOME/.profile"
- .tmux.conf
    * `ln -s` to "$HOME/.tmux.conf"
- .vim/
    * `ln -s` to "$HOME/.vim"
- .vimrc
    * `ln -s` to "$HOME/.vimrc"
- .zshrc
    * `ln -s` to "$HOME/.zshrc"
- nvim/
    * `ln -s` to "$HOME/.config/nvim/"
- scripts/
    * `ln -s` to "$HOME/scripts"
- terminator/
    * `ln -s` to "$HOME/.config/terminator"
- terminator-configs/
    * N/A

## Usages ##
- .backgrounds/
    * These are simply all of the backgrounds I like - right almost every one relates to arch
- .bashrc
  * The bashrc file can be used for any terminal device - such as a native terminal or a terminal emulator - that is running a bash (or even an sh) shell. For more information, you can read the bash manual (`man bash` or https://www.gnu.org/software/bash/manual/bash.html)
- compton.conf
    * configuration for compton that allows for smooth transitions and a simply a nicer look
- .i3status.conf
    * i3 status bar configuration
- .bash_profile
    * bash profile sourced first time in login shell
- .i3/
    * i3-wm configuration
- .idlerc/
    * simple idle solarized color scheme
- .keymap_caps2esc
    * keymap file that can configure the kb mappings with `setxkbmap`
- .profile
    * profile that should be sourced in order to set default text editor, etc
- .tmux.conf
    * tmux configuration file (key bindings, airline status bar at bottom, etc)
- .vim/
    * vim configuration file that contains a bundle/ directory for plugins, a color/ directory for colors, etc
- .vimrc
    * vim configuration file sourced when vim is run
- .zshrc
    * zsh configuration file that is sourced when zsh is run
- nvim/
    * vim configuration file that contains a bundle/ directory for plugins, a color/ directory for colors, etc. This folder actually contains an init.vim which is the configuraton file sourced for neovim with `nvim` is run
- scripts/
    * all of the scripts that I use often or that are just fun
- terminator/
    * terminator configuraton directory that holds terminator config files
- terminator-configs/
    * just some terminator colors schemes for you to choose from :) ... configure your own!


## LIST OF FREQUENTLY INSTALLED PACKAGES ##

### i3 ###

#### PACMAN ####
i3blocks
i3lock
i3status

#### AUR ####
i3-gaps-next-git


### FUNCTIONAL ###

#### PACMAN ####
conky
git
terminator
rxvt-unicode
dmenu
ranger
openssh
dzen2
python2
python3
lxappearance
screen
tmux
scrot

#### AUR ####
dmenu2
rofi-git


### SOUND ###

#### PACMAN ####
- alsa-utils
- ponymix
- pulseaudio
- pulseaudio-alsa


### FONTS ###

#### PACMAN ####
ttf-dejavu
ttf-inconsolata

#### AUR ####
powerline-fonts-git


### INTERTUBES ###

#### PACMAN ####
w3m
chromium
elink
lynx

#### AUR ####
firefox-nightly
rofi-surfraw-git


### FUNCTIONAL ###

### NETWORK MANAGEMENT ###

#### PACMAN ####
- networkmanager \*
- nm-connection-editor \*


### FUN ###

#### PACMAN ####
irssi
screenfetch
figlet
weechat

#### AUR ####


### MUSIC ###

#### PACMAN ####
sox

#### yaourt ####
pianorbar
blockify
python-docopt
spotify

## NOTES ABOUT IMPORTANT PACKAGES ##
(AUR) - Located in the Arch User Repository (AUR). Otherwise, it's found with in the standard arch repository with pacman. [link to repo].
(PROP) - Porprietary software.

\*\* You should almost certainly install this. Either something will not work, or you will be lack a lot of functionality that most modern-day computers can handle. Install things at your discretion - for example, if you want to install your own Window Manager (WM) or Desktop Environment (DE).
\* This is something that I always install. It's mostly for me to keep track of packages that I install over and over again. BUT! It can be used by you as well. Feel free to install (or uninstall!) these packages. :)

(1) i3-status - There are certainly better options, but i3-status is still pretty great. It's minimal, but nice. The main downfall is that it cannot update specific items in the status bar. Feel free to use i3-blocks, dzen2, etc.
(2) rofi - if you are not going to use rofi, then you should use some other menu or system launcheer, such as dmenu. Otherwise, **you __won't__ be able to able to launch dekstop applications or run commands without a terminal**.
(3) terminator - my favorite terminal. You're welcome to use xterm or gnome-terminal or whatever floats your boat. I just love terminator - give it consideration, at least!
(4) w3m - this is a console-based web browser with vim-like key bindings. It can support images, so I find that aspect quite useful. However, elink and lynx are both good replacements (neither can display images in the console, I don't think).
(5) firefox-nightly - this is just a "most recent build" of firefox. It can be unstable from what I have heard, though have only experienced minor issues once and am not sure if I can attribute it to the -nightly build itself. However, you can choose whatever browser you want; the following I find to be best: chromium-browser; firefox; midori.
(6) irssi - I use irssi instead of weechat. Sorry. q:)

## CONVENIENT INSTALLATION LISTS ##

### I3 \*\* ###
(pacman) i3lock i3status
(yaourt) i3-gaps-next-git

### NECESSARY \*\* ###
(pacman) alsa-utils git ponymix pulseaudio pulseaudio-alsa python python3 terminator
(yaourt) rofi

### ONES I ALWAYS INSTALL \* ###
(pacman) irssi lxappearance networkmanager nm-connection-editor screen scrot sox tmux ttf-dejavu ttf-inconsolata
(yaourt) firefox-nightly pianorbar powerline-fonts-git rofi-surfraw screenfetch
