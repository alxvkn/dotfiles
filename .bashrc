#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -ph --color=auto'
alias pacman='pacman --color=always'

alias ll='ls -l'

alias less='less -R'

PS1='[\u@\h \W]\$ '
