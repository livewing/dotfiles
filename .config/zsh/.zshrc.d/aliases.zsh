if builtin command -v gls > /dev/null 2>&1; then
  alias ls='gls --color=auto'
elif [[ $(uname) = 'Darwin' ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

if builtin command -v colordiff > /dev/null 2>&1; then
  alias diff=colordiff
elif is-at-least 3.4 $(diff --version | awk 'NR==1{print $NF}'); then
  alias diff='diff --color=auto'
fi

if builtin command -v ip > /dev/null 2>&1; then
  alias ip='ip --color=auto'
fi

if builtin command -v bat > /dev/null 2>&1; then
  alias cat=bat
fi

if [[ $(uname) != 'Darwin' ]] && builtin command -v xclip > /dev/null 2>&1; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -out'
fi

alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cdg=cd-gitroot


if builtin command -v thefuck > /dev/null 2>&1; then
  eval "$(thefuck --alias)"
fi
