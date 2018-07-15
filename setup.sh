#!/usr/bin/env bash


# Common config files to be stomped.
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
    echo "Stowing following files: ${configs[*]}"
    for symlink in "${configs[@]}"; do
        echo "Stowing: $symlink"
        # TODO: Add simulate option to stow. -n flag.
        stow -v -t $HOME "$symlink"
    done
}

is_stow_installed
is_tmuxinator_installed
running_shell
create_symlinks
