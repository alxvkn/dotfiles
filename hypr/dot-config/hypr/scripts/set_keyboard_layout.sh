#!/bin/sh

layout_index=$1

for keyboard in $(hyprctl devices -j | jq -r '.keyboards[].name'); do
    hyprctl switchxkblayout $keyboard $layout_index
done
