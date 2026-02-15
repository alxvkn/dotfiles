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

retry() {
    while ! sh -c "$@"; do sleep 1; done
}
