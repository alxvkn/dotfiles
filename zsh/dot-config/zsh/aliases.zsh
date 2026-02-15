# more of a default flags
alias ls='ls -Fh --color=auto'

## make less interpret color sequences
alias less='less -R'

## human readable sizes
alias df='df -h'

if [ -n "$(command -v eza)" ]; then
    alias ls='eza --icons=auto --classify=auto'
fi

alias cpr='rsync -hh --archive --partial --info=stats1,progress2 --modify-window=1' 
alias mvr='rsync -hh --archive --partial --info=stats1,progress2 --modify-window=1 --remove-source-files' 

# actual aliases
alias l='ls -l'
alias la='ls -la'

# shortcuts
alias n='nvim'
alias e="$EDITOR"
alias g='git'
alias r="source ~/.zshrc"
alias o=xdg-open

alias t='tmux'

alias fuck='doas $(fc -ln -1)'

alias daterfc='date --rfc-3339=date'

alias aunlock='adb shell input text $(cat ~/.phonepin)'
alias alock='adb shell input keyevent POWER'

alias aopen='adb shell am start -a android.intent.action.VIEW -d'

# if [ "$XDG_CURRENT_DESKTOP" = GNOME ]; then
#     alias doas='pkexec --keep-cwd'
# fi

[ "$(command -v todo.sh)" ] && alias to=todo.sh

alias doasreflector='doas sh -c "reflector > /etc/pacman.d/mirrorlist"'

alias ka=killall
