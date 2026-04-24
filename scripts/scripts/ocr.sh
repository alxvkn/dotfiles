#!/bin/sh

{
    if ! ollama ps; then
        notify-send -t 2000 -a OCR Error 'ollama ps failed'
        exit 1
    fi

    TEMP=/tmp/ocr.png

    if ! grim -t png -g "$(slurp)" "$TEMP"; then
        exit
    fi

    TEXT=$(ollama run glm-ocr Text Recognition: "$TEMP")
    wl-copy "$TEXT"
    notify-send -t 2000 -a OCR Success! "$TEXT"
    rm "$TEMP"
} >/dev/null 2>&1
