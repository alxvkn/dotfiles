#!/bin/sh

SCRNDIR="$HOME/.scrn"
SCRNFNAME="$SCRNDIR/$(date +%F.%H-%M-%S).png"

mkdir -p $SCRNDIR

if [ $# -gt 0 ]; then
    case $1 in
        -a | --area)
            grim -g "$(slurp)" -t png $SCRNFNAME
            ;;
        *)
            echo "usage: $0 [ -a | --area ]"
            exit 1
            ;;
    esac
else
    grim -t png $SCRNFNAME
fi

wl-copy < $SCRNFNAME
