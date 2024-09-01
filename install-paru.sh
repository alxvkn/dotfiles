#!/bin/sh

cd
git clone --depth 1 https://aur.archlinux.org/paru.git
cd paru
makepkg -si
