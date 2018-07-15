#!/usr/bin/env bash


# Common config files to be stowed.
declare -a configs=("common" "tmux" "vim")

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

running_shell() {
    # What shell are we running?
    shell=$(basename $SHELL)
    case $shell in
        zsh)
            configs+=("zsh")
            ;;
        bash)
            configs+=("bash")
            ;;
        *)
            echo "Shell $shell not configured."
            ;;
        esac
}

create_symlinks() {
    echo "Config files to be stowed: ${configs[*]}"
    for symlink in "${configs[@]}"; do
        echo "Stowing: $symlink"
        eval "${cmd[*]}" $symlink
    done
}

build_command() {
    cmd=("stow")
    if [ -n "$simulate" ] && [ "$simulate" -eq "1" ]; then
        cmd+=("-n")
    fi
    cmd+=("-t $HOME")
}

while getopts "n" opt; do
    case $opt in
        n)
            # Do not actually make any filesystem changes.
            simulate=1
            ;;
        *)
            exit 1
            ;;
    esac
done

is_stow_installed
is_tmuxinator_installed
running_shell
build_command
create_symlinks
