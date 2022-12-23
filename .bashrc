#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# some tweaks for this config
NOTES_DIR=~/.notes


# colors & styles
[ -n "$(command -v tput)" ] && {
    FG_GREEN="\[$(tput setaf 2)\]"
    FG_BLUE="\[$(tput setaf 4)\]"

    BOLD="\[$(tput bold)\]"

    RESET="\[$(tput sgr0)\]"
}

# prompt
PS1="[\u@\h ${FG_BLUE}\W${RESET}]\$ "

source ~/.config/alias.sh

# pywal colors
test -f ~/.cache/wal/sequences && (cat ~/.cache/wal/sequences &)

# evaluate strings with history substitutions before executing (!!,!$ etc.)
shopt -s histverify

# vi mode
set -o vi

# functions & aliases
# take quick notes
note() {
    SUBCOMMAND="$1"
    shift
    case $SUBCOMMAND in
        l | ls | list)
            ls $NOTES_DIR
            ;;
        s | show | c | cat)
            FILE="$NOTES_DIR/$1"
            if [[ -f $FILE ]]; then
                cat $FILE
            else
                echo "looks like $FILE doesn't exist"
            fi
            ;;
        a | ad | add)
            FILE="$NOTES_DIR/$1"
            shift
            {
                echo $(date) # timestamp
                echo "$@"
                echo # newline
            } >> $FILE
            ;;
    esac
}

[ -f "~/TODO.md" ] && cat ~/TODO.md # list todo notes on every shell startup
