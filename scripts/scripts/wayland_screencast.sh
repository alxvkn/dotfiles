#!/bin/sh

SCREENCAST_DIR=${SCREENCAST_DIR:-"$(xdg-user-dir VIDEOS)/Screencasts"}

REC_CMD="gpu-screen-recorder"

if [ $# -gt 0 ]; then
    while [ $# -gt 0 ]; do
        case "$1" in
            --area)
                SELECT_AREA=yes
                ;;
        esac
        shift
    done
fi

mkdir -p $SCREENCAST_DIR
FILE_PATH="$SCREENCAST_DIR/$(date +%F.%H-%M-%S).mp4"

if [ $SELECT_AREA = 'yes' ]; then
    GEOMETRY="$(slop)"
    if [ -n "$GEOMETRY" ]; then
        $REC_CMD -w region -region "$GEOMETRY" -o $FILE_PATH
    fi
else
    $REC_CMD -w portal -o $FILE_PATH
fi

wl-copy "$FILE_PATH"
