# sudobang bash integration
# Transforms a trailing ! into sudo-prefix and executes immediately.

__sudobang_enter() {
  local cmd="$READLINE_LINE"
  local replaced
  replaced="$(printf %s "$cmd" | sudobang)"
  # Replace buffer
  READLINE_LINE="$replaced"
  READLINE_POINT=${#READLINE_LINE}
  # Execute it now (single Enter behavior)
  printf '\n'
  builtin history -s "$READLINE_LINE"
  eval "$READLINE_LINE"
  READLINE_LINE=""
  READLINE_POINT=0
}

# Hook Enter and Ctrl-J
bind -x '"\C-m":"__sudobang_enter"'
bind -x '"\C-j":"__sudobang_enter"'

