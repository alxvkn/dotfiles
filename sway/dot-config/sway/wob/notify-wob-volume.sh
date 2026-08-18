#!/bin/sh
pactl -f json get-sink-volume 0 | jq -r '.volume."front-left".value_percent[:-1]' > /tmp/wob-volume
