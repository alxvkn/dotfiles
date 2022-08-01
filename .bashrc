#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -ph --color=auto'
alias pacman='pacman --color=always'

alias ll='ls -l'

alias less='less -R'

FG_GREEN="\[$(tput setaf 2)\]"
FG_BLUE="\[$(tput setaf 4)\]"
RESET="\[$(tput sgr0)\]"

BOLD="\[$(tput bold)\]"

PS1="[\u@\h ${FG_BLUE}\W${RESET}]\$ "

set -o vi
