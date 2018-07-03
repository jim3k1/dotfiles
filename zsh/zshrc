#!/usr/bin/env zsh

############## POWERLEVEL settings #####################################

# Needed for fonts displayed correctly
# POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_MODE='awesome-fontconfig'

# If you want to dump all of the icons you are using, shown in random colors,
# add the special segment icons_test to your prompt
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(icons_test)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon context dir virtualenv vcs ssh)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator battery)

# POWERLEVEL9K_MODE='nerdfont-complete'

# If your shorten strategy, below, is entire directories, this field
# determines how many directories to leave at the end. If your shorten
# strategy is by character count, this field determines how many
# characters to allow per directory string.
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

# Delimiter to use in truncated strings.
POWERLEVEL9K_SHORTEN_DELIMITER=""

# How the directory strings should be truncated.
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# If set to true and you are in a directory that you do not have write
# permissions for, this segment will display a lock icon and enter the NOT_WRITABLE state.
POWERLEVEL9K_DIR_SHOW_WRITABLE=true

# Set to true if you wish not to show the error code when the last command returned an error.
POWERLEVEL9K_STATUS_CROSS=true

POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"

################ End POWERLEVEL settings ##############################

# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory histignoredups histignorespace histsavenodups

# Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Default completion settings, formatting and messages
# http://zsh.sourceforge.net/Guide/zshguide06.html
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
# zstyle ':completion:*' menu select=long
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# End default completion settings

# Custom completion settings
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
# End custom completing settings

export EDITOR='vim'
export MINICOM='-m -c on'
export PATH=$PATH:/sbin:$HOME/android-sdk-linux/platform-tools:$HOME/pycharm/bin:$HOME/blackrose:$HOME/.local/bin:$HOME/custom/bin
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# ssh tunnel
# ssh -f ubuntu@155.210.71.151 -L 8000:localhost:80 -N

source $HOME/.aliases

source ~/.zplug/init.zsh

# Supports oh-my-zsh plugins and the like
zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-completions", from:github
zplug "zsh-users/zsh-syntax-highlighting", from:github
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "zsh-users/zsh-autosuggestions"
zplug "chrissicool/zsh-256color"
zplug "plugins/autopep8", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/debian", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/pyenv", from:oh-my-zsh
zplug "plugins/pylint", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "zpm-zsh/ssh", from:github
# zplug load --verbose
zplug load

fpath=($HOME/.zplug/repos/zsh-users/zsh-completions/src $fpath)

# Use modern completion system
autoload -Uz compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
