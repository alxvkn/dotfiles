#!/bin/sh

SCRNDIR="$HOME/.scrn"
SCRNFNAME="$SCRNDIR/$(date +%F.%H-%M-%S).png"

mkdir -p $SCRNDIR

# custom args will be added to this var
GRIM_CMD="grim -t png"

SAVE_TO_FILE=yes

if [ $# -gt 0 ]; then
    while [ $# -gt 0 ]; do
        case $1 in
            --area)
                GRIM_CMD="$GRIM_CMD -g \"$(slurp)\""
                ;;
            --no-save)
                SAVE_TO_FILE=no
                ;;
            *)
                echo "usage: $0 [ --area ] [ --no-save ]"
                echo "    --no-save    don't save to file, only copy to clipboard"
                exit 1
                ;;
        esac
    shift
    done
fi

# append filename to GRIM_CMD to save
if [ $SAVE_TO_FILE = 'yes' ]; then
    GRIM_CMD="$GRIM_CMD $SCRNFNAME"
    $GRIM_CMD
    wl-copy < $SCRNFNAME
else
    GRIM_CMD="$GRIM_CMD -"
    $GRIM_CMD | wl-copy
fi
