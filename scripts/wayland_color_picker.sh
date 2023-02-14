#!/bin/sh

COLOR_FORMAT=${COLOR_FORMAT:-hex}

if [ $COLOR_FORMAT = rgb ]; then
    CUT_FIELD=2
else
    CUT_FIELD=4
fi

wl-copy "$(grim -g "$(slurp -p)" -t png - |
    convert - -format '%[pixel:p{0,0}]' txt:- | tail -1 | cut -d ' ' -f $CUT_FIELD)"
