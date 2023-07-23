# more of a default flags
alias ls='ls -Fh --color=auto'

## make less interpret color sequences
alias less='less -R'

## human readable sizes
alias df='df -h'

if [ -n "$(command -v exa)" ]; then
    alias ls='exa --icons'
fi

# actual aliases
alias ll='ls -l'

# shortcuts
alias n='nvim'
alias e="$EDITOR"
alias g='git'
alias r="source ~/.zshrc"

alias t='tmux'

alias fuck='doas $(fc -ln -1)'

alias aunlock='adb shell input text $(cat ~/.phonepin)'
alias alock='adb shell input keyevent POWER'

alias aopen='adb shell am start -a android.intent.action.VIEW -d'

timer() {
    (
        seconds=$1
        shift
        sleep $seconds &&
            notify-send "timer $seconds seconds" "$*"
    )& disown
}

cht() {
    curl cht.sh/$1$(shift; (($# > 0)) && echo "/$@" | tr ' ' '+')
}
