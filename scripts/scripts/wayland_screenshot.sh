#!/bin/sh

SCREENSHOT_DIR=${SCREENSHOT_DIR:-"$HOME/.scrn"}

GRIM_CMD="grim -t png"

SAVE_TO_FILE=yes

if [ $# -gt 0 ]; then
    while [ $# -gt 0 ]; do
        case "$1" in
            --area)
                SELECT_AREA=yes
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

if [ $SAVE_TO_FILE = 'yes' ]; then
    mkdir -p $SCREENSHOT_DIR
    FILE_PATH="$SCREENSHOT_DIR/$(date +%F.%H-%M-%S).png"
fi

if [ $SELECT_AREA = 'yes' ]; then
    GEOMETRY="$(slurp)"
    if [ -n "$GEOMETRY" ]; then
        $GRIM_CMD -g "$GEOMETRY" - | tee $FILE_PATH | wl-copy
    fi
else
    $GRIM_CMD - | tee $FILE_PATH | wl-copy
fi
