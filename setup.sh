#!/usr/bin/env bash


# Common config files to be stomped.
declare -a configs=("bash" "common" "tmux" "vim" "zsh")

is_stow_installed() {
    if ! command -v stow > /dev/null; then
        echo "stow not installed. Exiting."
        exit 1
    fi
}

is_tmuxinator_installed() {
    if command -v tmuxinator > /dev/null; then
        configs+=("tmuxinator")
    fi
}

create_symlinks() {
    for symlink in "${configs[@]}"; do
        stow -v -n -t $HOME "$symlink"
    done
}

is_stow_installed
is_tmuxinator_installed
create_symlinks
