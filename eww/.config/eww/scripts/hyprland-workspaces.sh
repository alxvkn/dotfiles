#!/bin/sh

on_workspace_update() {
    hyprctl workspaces -j |
        jq -c 'map({id: .id, name: .name}) | sort_by(.id)'
}

on_workspace_update

socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - |
    while read -r event; do
        event_name="${event%%>>*}"
        if [ "$event_name" = "createworkspace" ] || [ "$event_name" = "destroyworkspace" ]; then
            on_workspace_update
        fi
    done
