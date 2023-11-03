#
# ~/.profile
#

if [ -n "$(command -v nvim)" ]; then
    export VISUAL="nvim --noplugin -u $HOME/.config/min-nvim/init.lua"
elif [ -n "$(command -v vim)" ]; then
    export VISUAL=vim
else
    export VISUAL=vi
fi

export MOZ_ENABLE_WAYLAND=1

export EDITOR="$VISUAL"

export WINEDLLOVERRIDES=winemenubuilder.exe=d

# optional custom location for npm global prefix
if [ -d "$HOME/.npm-global" ]; then
    export PATH="$HOME/.npm-global/bin:$PATH"
fi

if [ -d "$HOME/go/bin" ]; then
    export PATH="$HOME/go/bin:$PATH"
fi

export PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"

if [ "$(tty)" = '/dev/tty1' ]; then
    COMPOSITOR=sway
    if [ -n "$(command -v $COMPOSITOR)" ]; then
        echo starting "$COMPOSITOR"
        exec "$COMPOSITOR"
    fi
fi
