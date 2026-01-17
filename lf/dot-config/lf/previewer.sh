#!/bin/sh

# ffmpeg -i Videos/bookpro.mp4 -frames:v 1 -q:v 5 -f mjpeg - | chafa -f sixel -

case "$(file -Lb --mime-type -- "$1")" in
    image/*)
        chafa -f sixel -s "$2x$3" --animate off --polite on "$1"
        exit 1
        ;;
    application/vnd.sqlite3)
        sqlite3 "$1" .tables
        exit 1
        ;;
    application/zip)
        unzip -l "$1"
        exit 1
        ;;
    application/x-7z-compressed)
        7z -ba l "$1"
        exit 1
        ;;
    *)
        # if [ -n "$(command -v bat)" ]; then
        #     bat -f --style=numbers "$1"
        # else
        #     cat "$1"
        # fi
        cat "$1"
        ;;
esac
