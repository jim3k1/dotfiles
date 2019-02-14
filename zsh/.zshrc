#!/usr/bin/env zsh

export TERM="xterm-256color"

############## POWERLEVEL settings #####################################

# Needed for fonts displayed correctly
POWERLEVEL9K_MODE='nerdfont-fontconfig'

# If you want to dump all of the icons you are using, shown in random colors,
# add the special segment icons_test to your prompt
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(icons_test)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir virtualenv anaconda vcs ssh)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator load)

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
POWERLEVEL9K_COLOR_SCHEME='dark'

POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
# POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
# POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
# POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uF406'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='yellow'
POWERLEVEL9K_PYTHON_ICON='🐍'
POWERLEVEL9K_FAIL_ICON='✘' # U+2718
POWERLEVEL9K_LINUX_DEBIAN_ICON='' # U+F302

# It seems modified has precedence over untracked.
# POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
# POWERLEVEL9K_VCS_CLEAN_BACKGROUND='white'
# POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
# POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='white'
# POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
# POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='white'

################ End POWERLEVEL settings ##############################

############################ ZSH Options ##############################
# Set up the prompt
autoload -Uz promptinit
promptinit

# Do not enter command lines into the history list if they are duplicates of the previous event.
# Ignore duplication command history list
setopt histignoredups

# Ignore when commands starts with space
# Remove command lines from the history list when the first character on the line is a space,
# or when one of the expanded aliases contains a leading space.
setopt histignorespace

# If a new command line being added to the history list duplicates an older one, the older
# command is removed from the list (even if it is not the previous event).
setopt histignorealldups

# Turns on interactive comments; comments begin with a #.
setopt interactivecomments

# When writing out the history file, older commands that duplicate newer ones are omitted.
setopt histsavenodups

# Automatically use menu completion after the second consecutive request for completion,
# for example by pressing the tab key repeatedly. This option is overridden by MENU_COMPLETE.
setopt auto_menu

# auto change directory
# If a command is issued that can’t be executed as a normal command, and the command is the name
# of a directory, perform the cd command to that directory.
setopt auto_cd

# Complete path when aliased command
# Prevents aliases on the command line from being internally substituted before completion is attempted.
# The effect is to make the alias a distinct command for completion purposes.
setopt complete_aliases

# use brace
# Expand expressions in braces which would not otherwise undergo brace expansion to a lexically ordered
# list of all the characters.
setopt brace_ccl

# auto directory pushd that you can get dirs list by cd -[tab]
# Make cd push the old directory onto the directory stack.
setopt auto_pushd

# compacked complete list display
# Try to make the completion list smaller (occupying less lines) by printing the matches in columns
# with different widths.
setopt list_packed

# no beep sound when complete list displayed
setopt nolistbeep

# no no match found
# If a pattern for filename generation has no matches, print an error, instead of leaving it unchanged
# in the argument list. This also applies to file expansion of an initial ‘~’ or ‘=’.
setopt nonomatch

# multi redirect (e.x. echo "hello" > hoge1.txt > hoge2.txt)
# Perform implicit tees or cats when multiple redirections are attempted.
# http://zsh.sourceforge.net/Doc/Release/Redirection.html#Redirection
setopt multios

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
############################ End ZSH Options ##############################

# Command history configuration
# Keep 1000000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=$HOME/.zsh_history

# Default completion settings, formatting and messages
# http://zsh.sourceforge.net/Guide/zshguide06.html
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
# zstyle ':completion:*' menu select=long
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
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
# Needed for conda. To activate the completion cache for packages.
zstyle ':completion::complete:*' use-cache 1
# End custom completing settings

export EDITOR='vim'
export MINICOM='-m -c on'
export PATH=$PATH:/sbin:$HOME/android-sdk-linux/platform-tools:$HOME/pycharm/bin:$HOME/blackrose:$HOME/.local/bin:$HOME/custom/bin
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# ssh tunnel
# ssh -f ubuntu@remoteip -L 8000:localhost:80 -N

source $HOME/.aliases
source $HOME/.zplug/init.zsh

# Supports oh-my-zsh plugins and the like
zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", from:github
# Load theme
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
zplug "tmuxinator/tmuxinator", from:github, use:"completion/tmuxinator.zsh", if:"(( $+commands[tmuxinator] ))"
zplug "plugins/salt", from:oh-my-zsh, if:"(( $+commands[salt] ))"
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "zpm-zsh/ssh", from:github
zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "plugins/kubectl", from:oh-my-zsh, use:"kubectl.plugin.zsh", if:"(( $+commands[kubectl] ))"
zplug "esc/conda-zsh-completion", from:github
# zplug load --verbose
zplug load

fpath=($ZPLUG_REPOS/esc/conda-zsh-completion $fpath)

# Use modern completion system
autoload -Uz compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
