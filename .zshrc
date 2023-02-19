HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups

setopt notify
setopt shwordsplit # afaik iterate over words in a string as bash does

bindkey -v
bindkey '^W' backward-kill-word
bindkey '^U' backward-kill-line
bindkey '^F' forward-char
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^R' history-incremental-pattern-search-backward

source ~/.config/alias.sh

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

# prompt
PROMPT='(%n@%M %F{cyan}%U%2~%u%f) %# '
RPROMPT='%B%(0?.%F{green}ok%f.%F{red}%?%f) %b %*'

zstyle ':completion:*' format 'completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1

autoload -Uz compinit
compinit

if [ -n "$(command -v zoxide)" ]; then
    eval "$(zoxide init zsh)"
fi

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

: # make sure last status will be 0
