#!/bin/sh

volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1{ print $5 }')
volume=${volume%%%}

muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk 'NR==1{ print $2 }')

case "$muted" in
    no)
        echo $volume > $1
        ;;
    yes)
        echo 0 > $1
        ;;
esac
