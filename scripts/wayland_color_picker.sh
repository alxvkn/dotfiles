#!/bin/sh

# will use a normal slurp selection, because on all compositors i've used
# screenshot made with grim contains a cursor. so for this script to work you
# will have to slightly move your mouse down or right (or both)

grim -g "$(slurp -b 00000000)" -t png - |
    convert - -format '%[hex:p{0,0}]' info: | wl-copy
