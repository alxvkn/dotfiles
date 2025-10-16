# more of a default flags
alias ls='ls -Fh --color=auto'

## make less interpret color sequences
alias less='less -R'

## human readable sizes
alias df='df -h'

if [ -n "$(command -v eza)" ]; then
    alias ls='eza --icons=auto'
fi

alias cpr='rsync -hh --archive --partial --info=stats1,progress2 --modify-window=1' 
alias mvr='rsync -hh --archive --partial --info=stats1,progress2 --modify-window=1 --remove-source-files' 

# actual aliases
alias l='ls -l'
alias la='ls -la'

# shortcuts
alias n='nvim'
alias e="$EDITOR"
alias g='git'
alias r="source ~/.zshrc"
alias o=xdg-open

alias t='tmux'

alias fuck='doas $(fc -ln -1)'

alias daterfc='date --rfc-3339=date'

alias aunlock='adb shell input text $(cat ~/.phonepin)'
alias alock='adb shell input keyevent POWER'

alias aopen='adb shell am start -a android.intent.action.VIEW -d'

# if [ "$XDG_CURRENT_DESKTOP" = GNOME ]; then
#     alias doas='pkexec --keep-cwd'
# fi

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
)

update-zsh-plugins() (
    echo updating $fg[green]zsh$fg[default] plugins
    for p in ~/.zsh/plugins/*; do (cd "$p"; git pull); done
    echo
)

jg() {
    unset QUERY
    if [ $# -gt 0 ]; then
        QUERY="-q $1"
    fi
    if [ "$(git rev-parse --is-inside-work-tree 2>&1)" = "true" ]; then
        FILE="$(git ls-files | fzy $QUERY)"
        if [ -n "$FILE" ]; then
            nvim "$FILE"
        fi
    fi
}

jdf() {
    ( cd ~/.dotfiles && jg "$@" )
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

cmb() { # cmake build
    test -f CMakeLists.txt || return

    if ! [ -d build ]; then
        mkdir -p build
        cmake -B build || return
    fi

    cmake --build build
}

adbw() {
    for line in $(avahi-browse -ktrp _adb-tls-connect._tcp); do
        case $line in
            \=*)
                ;;
            *)
                continue
                ;;
        esac
        url=$(echo $line | awk -F ';' '{print $8 ":" $9}')

        adb_output=$(adb connect $url)
        case $adb_output in
            *connected*)
                echo $adb_output
                return 0
                ;;
            *)
                continue
                ;;
        esac
    done
}
