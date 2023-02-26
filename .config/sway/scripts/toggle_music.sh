if [ -n "$SWAYSOCK" ]; then
    if swaymsg -rt get_tree | grep tmux_music; then
        swaymsg '[app_id="tmux_music"]' kill
    else
        $TERM --app-id=tmux_music -e tmux a -t music
    fi
fi
