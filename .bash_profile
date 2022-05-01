#
# ~/.bash_profile
#

export TERMINAL=footclient
export EDITOR=nvim

export BEMENU_OPTS="--tb '#111111cc'    --tf '#ffffff'
                    --fb '#111111cc'    --ff '#ffffff'
                    --nb '#111111cc'    --nf '#bbbbbb'
                    --hb '#bbbbbb'      --hf '#000000'
                    --fn 'Fira Code 11'
                    -H 20 -W 0.3 -l 20 -fsp '' -i"

export PATH=${HOME}/bin:${PATH}

if [[ "$(tty)" == '/dev/tty1' ]]; then
    if [[ "$(command -v sway)" ]]; then
        exec sway
    fi
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
