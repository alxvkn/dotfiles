#!/bin/sh

# bg=#0C0C10
bg=#000000
fg=#ffffff
inactive_fg=#555555
accent=#ffaaff
wallpaper_dark=~/Pictures/arch_logo_white_on_black.png
wallpaper_light=~/Pictures/arch_logo_black_on_white.png

SCHEME=dark

if [ "$(gsettings get org.gnome.desktop.interface color-scheme)" = "'prefer-light'" ]; then
    SCHEME=light
    _bg=$bg
    bg=$fg
    fg=$_bg
fi

if [ $SCHEME = 'dark' ]; then
    WP=$wallpaper_dark
elif [ $SCHEME = 'light' ]; then
    WP=$wallpaper_light
fi

# TODO: swaylock
swaymsg -- set \$lock swaylock $([ -n "$WP" ] && echo "-i $WP") -c "${bg###}" --ring-color "${inactive_fg###}" > /dev/null

killall swaybg
swaybg -m fill -c "$bg" -i "$WP" > /dev/null &
# swaybg -c "$bg" > /dev/null &

{
    #       class                    border  bg      text    indicator   child_border
    swaymsg "client.focused          #ffffff $bg     $fg     #aaaaaa     $fg"
    swaymsg "client.focused_inactive #000000 $bg     #aaaaaa"
    swaymsg "client.unfocused        #000000 $bg     #aaaaaa $accent     $bg"


    swaymsg bar main colors "background          $bg"
    swaymsg bar main colors "statusline          $fg"
    swaymsg bar main colors "separator           $inactive_fg"

    #                                            border          bg      text
    swaymsg bar main colors "focused_workspace   $fg             $fg     $bg"
    swaymsg bar main colors "inactive_workspace  $bg             $bg     $inactive_fg"
    swaymsg bar main colors "urgent_workspace    $inactive_fg    $bg     #ffaaaa"
} > /dev/null 2>&1
