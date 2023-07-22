#!/bin/sh

if [ -z "$SWAYSOCK" ]; then
    export SWAYSOCK="/run/user/$(id -u)/sway-ipc.$(id -u).$(pidof sway).sock"
fi
echo $SWAYSOCK
