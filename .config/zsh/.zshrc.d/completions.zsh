setopt always_last_prompt
setopt complete_in_word
setopt list_packed
setopt list_types

zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*' format '%B%F{red}%d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' keep-prefix true
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' use-cache
zstyle ':completion:*' verbose true
zstyle ':completion:*:commands' rehash true

ZLE_REMOVE_SUFFIX_CHARS=""
