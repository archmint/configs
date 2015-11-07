# configs and more
--

## Within this repository are configuration files for the following ##
- .backgrounds/        - background images
- .bashrc              - bash profile (sourced for new bash shell)
- compton.conf         - compton configuration file
- .i3status.conf       - ~/.i3status.conf
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
- terminator-configs/  N/A

## Usages ##
- .backgrounds/
    * These are simply all of the backgrounds I like - right almost every one relates to arch
- /.bashrc
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

