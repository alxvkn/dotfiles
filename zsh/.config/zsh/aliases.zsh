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

hi() (
    set -e
    exit() {
        if [ $? != 0 ]; then
            echo $fg[red]something went wrong$fg[default]
        else
            echo all $bg[green]$fg[black]done$fg[default]$bg[default]!
        fi
    }
    trap exit EXIT
    echo hiiii
    cd ~/.dotfiles
    echo pulling $fg[blue]dotfiles$fg[default] updates
    git pull
    echo
    echo updating $fg[cyan]Neo$fg[green]vim$fg[default] plugins
    nvim --headless +'Lazy! sync' +TSUpdateSync +qa
    echo
)

gg() {
    if [ "$(git rev-parse --is-inside-work-tree 2>&1)" = "true" ]; then
        FILE="$(git ls-files | fzy)"
        if [ -n "$FILE" ]; then
            nvim "$FILE"
        fi
    fi
}
zle -N gg
bindkey -M viins ^g gg

timer() {
    (
        seconds=$1
        shift
        sleep $seconds &&
            notify-send "timer $seconds seconds $*"
    )& disown
}

cht() {
    curl cht.sh/$1$(shift; (($# > 0)) && echo "/$@" | tr ' ' '+')
}
