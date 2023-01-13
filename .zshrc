HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt hist_ignore_dups

setopt autocd notify
setopt shwordsplit # afaik iterate over words in a string as bash does

bindkey -v
bindkey '^W' backward-kill-word
bindkey '^U' backward-kill-line
bindkey '^F' forward-char
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^R' history-incremental-pattern-search-backward

source ~/.config/alias.sh

cht() {
    curl cht.sh/$1$(shift; (($# > 0)) && echo "/$@" | tr ' ' '+')
}

zstyle ':completion:*' format 'completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1

autoload -Uz compinit
compinit

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

# pywal colors
[ -z "$TMUX" ] && test -f ~/.cache/wal/sequences && (cat ~/.cache/wal/sequences &)

# list todos on every shell startup
test -f ~/TODO.md && cat ~/TODO.md

: # make sure last status will be 0
