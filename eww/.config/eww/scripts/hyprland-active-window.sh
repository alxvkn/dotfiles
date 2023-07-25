#!/bin/sh

get_active() {
    hyprctl activewindow -j | jq -c
}

get_active

socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - |
    while read -r event; do
        if [ "${event%%>>*}" = "activewindow" ]; then
            get_active
        fi
    done
