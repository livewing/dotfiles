autoload -U compinit; compinit

PROMPT='%F{007}[%f%F{red}%n%f%F{007}@%f%F{yellow}%m%f%F{007}:%f%F{green}%~%f%F{007}]%f
%F{007}%#%f '

# ls color
if [ "$(uname)" = "Darwin" ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
