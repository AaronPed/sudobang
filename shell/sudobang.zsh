# Replace current buffer via sudobang; only adds sudo if line ends with "!"
_sudobang-accept-line() {
  local newbuf
  newbuf=$(printf %s "$BUFFER" | sudobang)
  BUFFER=$newbuf
  zle accept-line
}
zle -N _sudobang-accept-line

# Bind Enter; if you’d rather keep Enter vanilla, bind another key instead.
bindkey '^M' _sudobang-accept-line
bindkey '^J' _sudobang-accept-line

