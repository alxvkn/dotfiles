HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups
setopt hist_ignore_space

setopt correct

setopt notify
setopt shwordsplit # afaik iterate over words in a string as bash does

bindkey -v
bindkey '^W' backward-kill-word
bindkey '^U' backward-kill-line
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# save current command line and clear the buffer
# to execute another command and then continue editing
bindkey '^Z' push-line

bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

# (at least on foot terminal)
bindkey "^[[1~" beginning-of-line # home key
bindkey "^[[4~" end-of-line # end key
bindkey "^[[3~" delete-char # delete key

bindkey -M viins kj vi-cmd-mode

bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M vicmd '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward
bindkey -M vicmd '^F' history-incremental-pattern-search-forward

autoload -Uz colors && colors

# edit in $EDITOR with <space>e
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd ' e' edit-command-line

source ~/.config/zsh/aliases.zsh

source ~/.config/zsh/vi-mode-cursor.zsh

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

if [ -n "$TERMUX_VERSION" ]; then
    # 󰀲
    PROMPT_HOST=""
elif echo "$HOST" | grep "mac" > /dev/null ; then
    PROMPT_HOST="󰀵"
elif [ -f /etc/os-release ]; then
    source /etc/os-release
    # TODO: desktop detection adjustment
    if [ "$ID" = arch ]; then
        PROMPT_HOST='󰣇'
    fi
else
    PROMPT_HOST='%m'
fi

# prompt
PROMPT="┌$PROMPT_HOST %n%F{blue} %B%2~%b%f %(0?.%F{green}✓%f.💀 %F{red}%?%f)"$'\n└%# '

zstyle ':completion:*' completer _expand_alias _complete _correct
zstyle ':completion:*' matcher-list 'r:|[-_./]=** r:|=*'
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

if ! [ -f ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
fi
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

if ! [ -f ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/plugins/zsh-syntax-highlighting
fi
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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

if [ -n "$(command -v tmux)" ]; then
    if [ -z "$TMUX" ] && ! [ "$TERM" = "linux" ]; then
        tmux attach || tmux
    fi
fi

# test -f ~/TODO.md && cat ~/TODO.md

# pywal colors
# [ -z "$TMUX" ] && test -f ~/.cache/wal/sequences && (cat ~/.cache/wal/sequences &)

: # make sure last status will be 0
