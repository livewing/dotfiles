# XDG Base Directory
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

# Paths
if builtin command -v ruby > /dev/null 2>&1; then
  PATH=$(ruby -e 'puts Gem.path.map{|p|"#{p}/bin"}.join":"'):$PATH
fi
typeset -U path PATH
path=(
  $HOME/.local/bin(N-/)  # User binaries
  $HOME/.cargo/bin(N-/)  # Rust (rustup)
  $HOME/.deno/bin(N-/)   # Deno
  $HOME/.go/bin(N-/)     # Go
  $HOME/.yarn/bin(N-/)   # Yarn
  $path
)

# Editor envs
if builtin command -v nvim > /dev/null 2>&1; then
  export EDITOR=nvim
  export VISUAL=nvim
elif builtin command -v vim > /dev/null 2>&1; then
  export EDITOR=vim
  export VISUAL=vim
else
  export EDITOR=vi
  export VISUAL=vi
fi
export PAGER=less

# Other envs
export FZF_DEFAULT_OPTS="--reverse --extended --cycle"
export GOPATH="$HOME/.go"
export GPG_TTY=$(tty)
export LESS='-FiMRX --shift 4'

# LS_COLORS
source "$XDG_CONFIG_HOME/zsh/.zshenv.d/lscolors.zsh"

# Source .zshenv.local if present
if [[ -e $HOME/.zshenv.local ]]; then
  source "$HOME/.zshenv.local"
fi
