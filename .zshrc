autoload -U compinit; compinit

PROMPT='%n@%m:%~ %# '

# ls color
if [ "$(uname)" = "Darwin" ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
