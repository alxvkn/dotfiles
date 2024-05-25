#/bin/sh

TITLE='Low battery'

TEXT='Battery level is very low.\n Would you like to <b>hibernate now</b>?'

question() {
    DISPLAY=:0 zenity --question \
        --title="$TITLE" \
        --default-cancel \
        --icon=battery-level-0 \
        --modal \
        --text="$TEXT" 2>/dev/null
}

if question; then
    systemctl hibernate
fi
