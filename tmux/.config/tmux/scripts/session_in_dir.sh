#!/bin/sh

set -x

DIR="$1"
NAME=$(basename "$DIR")

if ! tmux has-session -t "$NAME"; then
    tmux new-session -ds "$NAME" -c "$DIR"
    if [ -x "$DIR/.tmux-session.sh" ]; then
        tmux run-shell -c "$DIR" "$DIR/.tmux-session.sh"
    fi
fi

if [ "$TMUX" ]; then
    tmux switch-client -t "$NAME"
else
    tmux attach -t "$NAME"
fi
