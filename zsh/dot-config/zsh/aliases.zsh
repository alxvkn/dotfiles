# more of a default flags
alias ls='ls -Fh --color=auto'

## make less interpret color sequences
alias less='less -R'

## human readable sizes
alias df='df -h'

if [ -n "$(command -v eza)" ]; then
    alias ls='eza --icons=auto'
fi

alias cpr='rsync -hh --archive --info=stats1,progress2 --modify-window=1' 
alias mvr='rsync -hh --archive --info=stats1,progress2 --modify-window=1 --remove-source-files' 

# actual aliases
alias ll='ls -l'

# shortcuts
alias n='nvim'
alias e="$EDITOR"
alias g='git'
alias r="source ~/.zshrc"
alias o=xdg-open

alias t='tmux'

alias fuck='doas $(fc -ln -1)'

alias aunlock='adb shell input text $(cat ~/.phonepin)'
alias alock='adb shell input keyevent POWER'

alias aopen='adb shell am start -a android.intent.action.VIEW -d'

if [ "$XDG_CURRENT_DESKTOP" = GNOME ]; then
    alias doas='pkexec --keep-cwd'
fi

[ "$(command -v todo.sh)" ] && alias to=todo.sh

alias doasreflector='doas sh -c "reflector > /etc/pacman.d/mirrorlist"'

alias ka=killall

hi() (
    set -e
    exit() {
        if [ $? != 0 ]; then
            echo $fg[red]something went wrong$fg[default]
        else
            echo all $bg[green]$fg[black]done$fg[default]$bg[default]! byeee
        fi
    }
    trap exit EXIT

    echo hiiii

    # udpate dotfiles
    cd ~/.dotfiles
    echo pulling $fg[blue]dotfiles$fg[default] updates
    git pull

    echo

    # optionally update neovim plugins
    read ans\?"$fg_bold[default]update $fg[cyan]Neo$fg[green]vim$fg[default] plugins? [y/N] $fg_no_bold[default]"
    case "$ans" in
        Y | y | yes)
            echo updating $fg[cyan]Neo$fg[green]vim$fg[default] plugins
            nvim --headless +'Lazy! sync' +TSUpdateSync +qa
            ;;
        *)
    esac

    echo

    # optionally update zsh plugins
    read ans\?"$fg_bold[default]update $fg[green]zsh$fg[default] plugins? [y/N] $fg_no_bold[default]"

    case "$ans" in
        Y | y | yes)
            echo updating $fg[green]zsh$fg[default] plugins
            for p in ~/.zsh/plugins/*; do (cd "$p"; git pull); done
            ;;
        *)
    esac

    echo
)

jg() {
    if [ "$(git rev-parse --is-inside-work-tree 2>&1)" = "true" ]; then
        FILE="$(git ls-files | fzy)"
        if [ -n "$FILE" ]; then
            nvim "$FILE"
        fi
    fi
}

jdf() {
    ( cd ~/.dotfiles && jg )
}

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
