#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# some tweaks for this config
NOTES_DIR=~/.notes


# colors & styles
command -v tput &> /dev/null && {
    FG_GREEN="\[$(tput setaf 2)\]"
    FG_BLUE="\[$(tput setaf 4)\]"

    BOLD="\[$(tput bold)\]"

    RESET="\[$(tput sgr0)\]"
}

# prompt
PS1="[\u@\h ${FG_BLUE}\W${RESET}]\$ "

# default ls flags
alias ls='ls -ph --color=auto'

# make less interpret color sequences
alias less='less -R'


# pywal colors
test -f ~/.cache/wal/sequences && (cat ~/.cache/wal/sequences &)

# evaluate strings with history substitutions before executing (!!,!$ etc.)
shopt -s histverify

# vi mode
set -o vi

# functions & aliases
# take quick notes
note() {
    FILE="$NOTES_DIR/$1"
    shift
    {
        echo $(date) # timestamp
        echo "$@"
        echo # newline
    } >> $FILE
}

alias ll='ls -l'
