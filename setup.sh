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
    # We don't needed tmuxinator in every single place.
    if command -v tmuxinator > /dev/null; then
        configs+=("tmuxinator")
    fi
}

create_symlinks() {
    for symlink in "${configs[@]}"; do
        # TODO: Add simulate option to stow. -n flag.
        stow -v -t $HOME "$symlink"
    done
}

is_stow_installed
is_tmuxinator_installed
create_symlinks
