#!/bin/sh

# mostly copied from https://wiki.archlinux.org/title/Udisks

path_to_name() {
    2>/dev/null udevadm info -p /sys/"$1" | awk -v FS== '/DEVNAME/ {print $2}'
}

stdbuf -oL udevadm monitor --udev -s block | while read -r _ _ event devpath _; do
    # we only care about partitions
    if echo "$devpath" | grep '[0-9]$' >/dev/null ; then
        devname=$(path_to_name "$devpath")
        if [ "$event" = add ]; then
            udisksctl mount -b "$devname" 2>&1 > /dev/null &&
                notify-send -t 2000 "$devname" 'mounted'
        fi
    fi
done
