alias ls='ls -Fh --color=auto'
alias less='less -R'

alias ll='ls -l'

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt hist_ignore_dups

setopt autocd notify histverify
setopt shwordsplit # afaik iterate over words in a string as bash does

bindkey -v
bindkey '^W' backward-kill-word
bindkey '^U' backward-kill-line
bindkey '^F' forward-char
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^R' history-incremental-pattern-search-backward


zstyle ':completion:*' format 'completing %d'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1

autoload -Uz compinit
compinit

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pywal colors
test -f ~/.cache/wal/sequences && (cat ~/.cache/wal/sequences &)

# list todos on every shell startup
test -f ~/TODO.md && cat ~/TODO.md

: # make sure last status will be 0
