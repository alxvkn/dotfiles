#
# ~/.profile
#

export TERMINAL=footclient

if [ -n $(command -v nvim) ]; then
    export VISUAL="nvim --noplugin -u /dev/null"
elif [ -n $(command -v vim) ]; then
    export VISUAL=vim
else
    export VISUAL=vi
fi

export EDITOR="$VISUAL"

export BEMENU_OPTS="--tb '#111111cc'    --tf '#ffffff'
                    --fb '#111111cc'    --ff '#ffffff'
                    --nb '#111111cc'    --nf '#bbbbbb'
                    --hb '#bbbbbb'      --hf '#000000'
                    --fn 'Fira Code 11'
                    -H 20 -W 0.3 -l 20 -fsp '' -i"

export WINEDLLOVERRIDES=winemenubuilder.exe=d

export PATH=${HOME}/bin:${PATH}

if [ "$(tty)" = '/dev/tty1' ]; then
    if [ -n "$(command -v sway)" ]; then
        if [ -n "$BASH_VERSION" ]; then
            read -p 'starting sway in 3 seconds. continue? [Y/n] ' -t 3 -n 1 ans
        elif [ -n "$ZSH_VERSION" ]; then
            read -k 1 -t 3 '?starting sway in 3 seconds. continue? [Y/n] ' ans
        else # guessing posix sh
            echo 'starting sway in 3 seconds. ^C to cancel'
            if ! sleep 3; then
                ans='n'
            fi
        fi
        echo
        case "$ans" in
            # hitting enter in bash gives an empty string,
            # while in zsh the variable consists of one newline character
            # i guess there is something about word splitting
            # i.e. in zsh it doesn't happen on strings with only separators
            $'\n' | '' | 'y' | 'Y')
                exec sway
                ;;
        esac
        echo 'staying in shell'
    fi
fi
