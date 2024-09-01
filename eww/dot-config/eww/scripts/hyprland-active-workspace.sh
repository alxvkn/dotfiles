#!/bin/sh

get_active() {
    hyprctl monitors -j | jq --unbuffered -c '.[] | select(.focused == true).activeWorkspace'
}

get_active

socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - |
    while read -r event; do
        if [ "${event%%>>*}" = "workspace" ]; then
            get_active
        fi
    done
