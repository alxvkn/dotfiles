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
alias r="source $ZDOTDIR/.zshrc"

alias t='tmux'

alias fuck='doas $(fc -ln -1)'

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
