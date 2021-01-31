autoload -Uz add-zsh-hook
autoload -Uz compinit
autoload -Uz select-bracketed
autoload -Uz select-quoted
autoload -Uz surround
autoload -Uz terminfo
autoload -Uz vcs_info

source $XDG_CONFIG_HOME/zsh/.zshrc.d/plugins.zsh
source $XDG_CONFIG_HOME/zsh/.zshrc.d/history.zsh
source $XDG_CONFIG_HOME/zsh/.zshrc.d/options.zsh
source $XDG_CONFIG_HOME/zsh/.zshrc.d/terminal_title.zsh
source $XDG_CONFIG_HOME/zsh/.zshrc.d/prompt.zsh
source $XDG_CONFIG_HOME/zsh/.zshrc.d/keybind.zsh
source $XDG_CONFIG_HOME/zsh/.zshrc.d/completions.zsh
source $XDG_CONFIG_HOME/zsh/.zshrc.d/aliases.zsh
source $XDG_CONFIG_HOME/zsh/.zshrc.d/functions.zsh

# Source .zshrc.local if present
if [[ -e $HOME/.zshrc.local ]]; then
  source "$HOME/.zshrc.local"
fi
