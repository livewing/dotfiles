# autoloads
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit && compinit -C
autoload -Uz promptinit && promptinit
autoload -Uz vcs_info

# zplug
export ZPLUG_HOME=$HOME/.zplug
if [ ! -e $ZPLUG_HOME/init.zsh ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh && until [ -e $ZPLUG_HOME/init.zsh ]; do; done
fi
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build: 'zplug --self-manage'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

if ! zplug check --verbose; then
    printf 'Install? [y/N]: '
    if read -q; then
        echo
        zplug install
    fi
fi
zplug load

# options
setopt print_eight_bit
setopt multios
setopt extended_glob
setopt globdots
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

# stop eating space before pipe symbol
ZLE_REMOVE_SUFFIX_CHARS=""

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_expand
setopt inc_append_history
setopt share_history
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# completions
setopt auto_param_slash
setopt mark_dirs
setopt list_types
setopt list_packed
setopt auto_list
setopt auto_menu
setopt auto_param_keys
setopt magic_equal_subst
setopt complete_in_word
setopt always_last_prompt
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*' format '%B%F{red}%d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' list-colors 'rs=0' 'di=01;34' 'ln=01;36' 'mh=00' 'pi=40;33' 'so=01;35' 'do=01;35' 'bd=40;33;01' 'cd=40;33;01' 'or=40;31;01' 'mi=00' 'su=37;41' 'sg=30;43' 'ca=30;41' 'tw=30;42' 'ow=34;42' 'st=37;44' 'ex=01;32'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' recent-dirs-insert both
zstyle ':completion:*' use-cache true

# aliases
if [ "$(uname)" = "Darwin" ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'
if which nvim >/dev/null 2>&1; then
    export EDITOR=nvim
    export VISUAL=nvim
    alias vi=nvim
    alias vim=nvim
    alias vimdiff='nvim -d'
elif which vim >/dev/null 2>&1; then
    export EDITOR=vim
    export VISUAL=vim
    alias vi=vim
fi

# prompt
setopt prompt_subst
function precmd_vcs() {
    vcs_info
}
add-zsh-hook precmd precmd_vcs
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '%F{red}!%f'
zstyle ':vcs_info:git:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:*' formats ' %F{007}vcs=%f%F{cyan}(%b)%f%c%u'
zstyle ':vcs_info:*' actionformats '%F{cyan}(%b - %f%F{red}%a%f%F{cyan})%f%c%u'
PROMPT=''
PROMPT=$PROMPT'%F{007}[%f%F{red}%n%f%F{007}@%f%F{yellow}%m%f%F{007}:%f%F{green}%~%f%F{007}]%f'
PROMPT=$PROMPT'${vcs_info_msg_0_}'
PROMPT=$PROMPT'%(?.. %F{007}\$?=%f%F{red}%?%f)'
PROMPT=$PROMPT'
%F{007}%#%f '

# terminal title bar
function precmd_terminal_title() {
    echo -n "\e]7;$(pwd)\a"
}
add-zsh-hook precmd precmd_terminal_title
