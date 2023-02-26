# more of a default flags
alias ls='ls -Fh --color=auto'

## make less interpret color sequences
alias less='less -R'

# actual aliases
alias ll='ls -l'

# shortcuts
alias n='nvim'
alias e="$EDITOR"
alias g='git'
alias t='tmux'

alias fuck='doas $(fc -ln -1)'

# reload config
if [ -n "$BASH_VERSION" ]; then
    alias r='source ~/.bashrc'
elif [ -n "$ZSH_VERSION" ]; then
    alias r="source $ZDOTDIR/.zshrc"
fi

if [ -n "$(command -v pacman)" ]; then
    alias p='pacman'
fi
