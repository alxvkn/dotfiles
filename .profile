#
# ~/.profile
#

if [ -n $(command -v nvim) ]; then
    export VISUAL="nvim --noplugin -u $HOME/.config/min-nvim/init.lua"
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

# optional custom location for npm global prefix
if [ -d "$HOME/.npm-global" ]; then
    export PATH="$HOME/.npm-global/bin:$PATH"
fi

export PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"

if [ "$(tty)" = '/dev/tty1' ]; then
    COMPOSITOR=sway
    if [ -n "$(command -v $COMPOSITOR)" ]; then
        echo starting "$COMPOSITOR"
        exec "$COMPOSITOR"
    fi
fi
