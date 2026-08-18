#!/bin/sh

[ -p /tmp/wob-volume ] || mkfifo /tmp/wob-volume && tail -f /tmp/wob-volume | wob -c ~/.config/sway/wob/volume.ini
