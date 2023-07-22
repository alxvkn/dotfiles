#!/bin/sh

if tmux has-session -t music; then
    playerctl -p mpv play-pause # requires mpv-mpris plugin
else
    tmux new -d -c "$HOME/music" -s music 'mpv --shuffle mixes/*'
fi
