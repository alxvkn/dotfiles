HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups
setopt hist_ignore_space

setopt notify
setopt shwordsplit # afaik iterate over words in a string as bash does

bindkey -v
bindkey '^W' backward-kill-word
bindkey '^U' backward-kill-line
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

# (at least on foot terminal)
bindkey "^[[1~" beginning-of-line # home key
bindkey "^[[4~" end-of-line # end key

bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M vicmd '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward
bindkey -M vicmd '^F' history-incremental-pattern-search-forward

# edit in $EDITOR with <space>e
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd ' e' edit-command-line

source $ZDOTDIR/aliases.zsh

source $ZDOTDIR/vi-mode-cursor.zsh

# toggle doas at line beginning
toggle-doas() {
    if [ -z "$BUFFER" ]; then # empty buffer, use previous line, add doas
        BUFFER="doas $(fc -ln -1)"
    elif [[ "$BUFFER" = "doas "* ]]; then # there already is doas, remove it
        BUFFER=${BUFFER#'doas '}
    else # non-emtpy buffer, add doas to it
        BUFFER="doas $BUFFER"
    fi
    zle end-of-line
}
zle -N toggle-doas
bindkey '^O' toggle-doas

# if 'fuck' is typed, set buffer to previous command prefixed with doas
_fuck() {
    if [ "$BUFFER" = "fuck" ]; then
        # clear buffer and call toggle-doas
        BUFFER=
        toggle-doas
    else
        zle accept-line
    fi
}
zle -N _fuck
bindkey '^M' _fuck

cht() {
    curl cht.sh/$1$(shift; (($# > 0)) && echo "/$@" | tr ' ' '+')
}

if [ -n "$TERMUX_VERSION" ]; then
    PROMPT_OS="%F{green}󰀲%f "
elif [ -f /etc/os-release ]; then
    source /etc/os-release
    if [ "$ID" = arch ]; then
        PROMPT_OS="%F{cyan}%f "
    fi
else
    PROMPT_OS=
fi

# prompt
PROMPT="┌$PROMPT_OS%n %B%2~%b"$'\n└%# '
RPROMPT="%(0?..%F{red}%?%f 💀)"

zstyle ':completion:*' format 'completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1

autoload -Uz compinit
compinit

zmodload zsh/complist
bindkey -M menuselect h vi-backward-char
bindkey -M menuselect j vi-down-line-or-history
bindkey -M menuselect k vi-up-line-or-history
bindkey -M menuselect l vi-forward-char

if [ -n "$(command -v zoxide)" ]; then
    eval "$(zoxide init zsh)"
fi

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# https://git.kernel.org/pub/scm/git/git.git/plain/contrib/completion/git-completion.zsh
# zsh's built-in git completion is slow.
# script by the link above supposed to work faster (being official from the git distribution)
# and i assume is downloaded and located under ~/.zsh/_git
# TODO: do something nicer about all this and other plugins
if [ -d ~/.zsh ]; then
    fpath=(~/.zsh $fpath)
fi

# TODO: port and kinda finish note script from bashrc
# create a todo script

# test -f ~/TODO.md && cat ~/TODO.md

# pywal colors
# [ -z "$TMUX" ] && test -f ~/.cache/wal/sequences && (cat ~/.cache/wal/sequences &)

timer() {
    (
        seconds=$1
        shift
        sleep $seconds &&
            notify-send "timer $seconds seconds" "$*"
    )& disown
}

: # make sure last status will be 0
