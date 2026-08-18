#!/bin/sh
v="$(brightnessctl -m | cut -d , -f4)"
echo "${v%?}" > /tmp/wob-brightness
