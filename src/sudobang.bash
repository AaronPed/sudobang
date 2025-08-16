__sudobang_enter() {
  # Replace the editable line via sudobang
  local replaced
  replaced="$(printf %s "$READLINE_LINE" | sudobang)"
  READLINE_LINE="$replaced"
  READLINE_POINT=${#READLINE_LINE}
}
# Hook Enter and Ctrl-J
bind -x '"\C-m":"__sudobang_enter"'
bind -x '"\C-j":"__sudobang_enter"'

