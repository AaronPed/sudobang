function __sudobang_accept --description "sudo on trailing !"
    set -l line (commandline)           # get buffer
    set -l new (printf "%s" "$line" | sudobang)
    commandline --replace "$new"
    commandline -f execute
end

# Bind Enter; change if you prefer a different key
bind \r __sudobang_accept
bind \n __sudobang_accept

