#!/bin/sh

[ -p /tmp/wob-brightness ] || mkfifo /tmp/wob-brightness && tail -f /tmp/wob-brightness | wob -c ~/.config/sway/wob/brightness.ini
