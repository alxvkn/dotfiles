zle-keymap-select() {
    # change cursor style on keymap change
    if [[ $KEYMAP = vicmd ]]; then
        echo -ne '\e[0 q'
    elif [[ $KEYMAP = main ]]; then
        echo -ne '\e[6 q'
    fi
}
zle -N zle-keymap-select
echo -ne '\e[6 q' # beam on startup
preexec() { echo -ne '\e[6 q' } # beam on new prompt
