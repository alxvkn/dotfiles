#!/bin/sh

bg=#0C0C10
fg=#ffffff
inactive_fg=#444444
accent=#ffaaff

SCHEME=d

if [ "$(gsettings get org.gnome.desktop.interface color-scheme)" = "'prefer-light'" ]; then
    SCHEME=l
    _bg=$bg
    bg=$fg
    fg=$_bg
fi

# TODO: swaylock

killall swaybg
swaybg -i ~/.local/share/backgrounds/amber-$SCHEME.jxl > /dev/null & disown

{
    #       class                    border  bg      text    indicator   child_border
    swaymsg "client.focused          $fg     $bg     $fg     #aaaaaa     #aaaaaa"
    swaymsg "client.focused_inactive #000000 $bg     #aaaaaa"
    swaymsg "client.unfocused        #000000 $bg     #aaaaaa             #000000"


    swaymsg bar main colors "background          $bg"
    swaymsg bar main colors "statusline          $fg"
    swaymsg bar main colors "separator           $inactive_fg"

    #                                            border          bg      text
    swaymsg bar main colors "focused_workspace   $fg             $fg     $bg"
    swaymsg bar main colors "inactive_workspace  $inactive_fg    $bg     $inactive_fg"
    swaymsg bar main colors "urgent_workspace    $inactive_fg    $bg     #ffaaaa"
} 2>&1 > /dev/null
