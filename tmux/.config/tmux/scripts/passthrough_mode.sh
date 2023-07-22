#!/bin/sh

# TODO: accept keybind as an argument and maybe convert to tpm plugin
# (tbh i don't really like tpm)

if [ $# -lt 1 ]; then
    echo 'no arguments, expected ( on | off )'
    exit 1
fi

case "$1" in
    "on")
        # unset prefix and save old value into @_prefix
        tmux set -gF @_prefix "#{prefix}" \; set -g prefix None \; display 'prefix key disabled'
        tmux bind -n F12 run-shell "$0 off"
        ;;
    "off")
        # restore prefix from @_prefix
        tmux set -gF prefix "#{@_prefix}" \; display 'prefix key enabled'
        tmux bind -n F12 run-shell "$0 on"
        ;;
    *)
        echo 'invalid argument, expected [ on | off ]'
        exit 1
        ;;
esac
