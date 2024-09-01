#!/bin/sh

cd
git clone --depth 1 https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
