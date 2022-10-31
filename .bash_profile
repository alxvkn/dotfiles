#
# ~/.bash_profile
#

export TERMINAL=footclient
export VISUAL=vi
export EDITOR="$VISUAL"

export BEMENU_OPTS="--tb '#111111cc'    --tf '#ffffff'
                    --fb '#111111cc'    --ff '#ffffff'
                    --nb '#111111cc'    --nf '#bbbbbb'
                    --hb '#bbbbbb'      --hf '#000000'
                    --fn 'Fira Code 11'
                    -H 20 -W 0.3 -l 20 -fsp '' -i"

export WINEDLLOVERRIDES=winemenubuilder.exe=d

export PATH=${HOME}/bin:${PATH}

if [[ "$(tty)" == '/dev/tty1' ]]; then
    if [[ "$(command -v sway)" ]]; then
        read -p 'starting sway in 3 seconds. continue? [Y/n] ' -t 5 -n 1 ans
        echo
        case $ans in
            'y' | 'Y' | '')
                exec sway
                ;;
        esac
        echo 'staying in shell'
    fi
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
