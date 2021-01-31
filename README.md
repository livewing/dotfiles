# dotfiles

[![CI](https://github.com/gssequence/dotfiles/workflows/CI/badge.svg)](https://github.com/gssequence/dotfiles/actions?query=workflow%3ACI)
[![LICENSE](https://img.shields.io/github/license/gssequence/dotfiles)](./LICENSE)

![Screenshot](https://user-images.githubusercontent.com/7447366/106382257-b1765800-6401-11eb-9c45-43fd9cb0c09b.png)

## Required components

- [zsh](https://www.zsh.org/)
- [Git](https://git-scm.com/) -- Apple Git does NOT support XDG Base Directory, so you should use ordinary Git.
- [tmux](https://github.com/tmux/tmux)
- [Neovim](https://neovim.io/)
- [Node.js](https://nodejs.org/) -- required by coc.nvim
- [npm](https://www.npmjs.com/) -- required by coc.nvim
- [fzf](https://github.com/junegunn/fzf)

## Optional components

- [bat](https://github.com/sharkdp/bat) -- colorized `cat`. `alias cat=bat` will be defined if `bat` exists
- GNU `ls` in [Coreutils](https://www.gnu.org/software/coreutils/coreutils.html) -- `ls` using `$LS_COLORS` (BSD `ls` uses `$LSCOLORS`, not `$LS_COLORS`). `alias ls=gls` will be defined if `gls` exists
- [The Fuck](https://github.com/nvbn/thefuck) -- command correction tool. `fuck` function will be defined if `thefuck` exists

## Install

### Bootstrap script (recommended)

```sh
$ curl -fsSL r.livewing.net/dot | sh
```

If you want to clone the repository using SSH, run below instead:

```sh
$ curl -fsSL r.livewing.net/dot | sh -s -- --ssh
```

NOTE: `r.livewing.net/dot` will redirect to [the bootstrap script](./etc/bootstrap.sh).

### Clone manually

```sh
$ cd
$ git clone https://github.com/gssequence/dotfiles.git
$ ./dotfiles/bin/install-dotfiles
```

### Temporary install

Change home directory by exporting `$HOME`, then install dotfiles.

```sh
$ export HOME="/path/to/temporary/home"
$ curl -fsSL r.livewing.net/dot | sh
```

## Configure

### Git

Git configuration is stored in `$XDG_CONFIG_HOME/git/config`, except for the user identity. You should configure it by following commands:

```sh
$ git config --global user.name 'Your Name'
$ git config --global user.email 'you@example.com'
```

If you want to sign the commits, run below:

```sh
$ git config --global commit.gpgsign true
```

NOTE: `git config --global` command tries to write configurations to existing `$HOME/.gitconfig` rather than `$XDG_CONFIG_HOME/git/config`.

### Environment-specific configurations

Some configurations can be written outside of version control:

- `$HOME/.gitconfig`
- `$HOME/.tmux.conf.local`
- `$HOME/.vimrc.local`
- `$HOME/.zshenv.local`
- `$HOME/.zshrc.local`

## Cheat sheet

### tmux

- <kbd>Control</kbd>+<kbd>b</kbd>: Prefix (default)
- <kbd>Meta</kbd>+<kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd>: Select pane
- <kbd>Meta</kbd>+<kbd>m</kbd>: Maximize/Restore pane
- <kbd>Shift</kbd>+<kbd>Meta</kbd>+<kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd>: Resize pane
- <kbd>Meta</kbd>+<kbd>1</kbd><kbd>2</kbd><kbd>3</kbd><kbd>4</kbd><kbd>5</kbd>: Select layout
  - <kbd>Meta</kbd>+<kbd>1</kbd>: Even-horizontal
  - <kbd>Meta</kbd>+<kbd>2</kbd>: Even-vertical
  - <kbd>Meta</kbd>+<kbd>3</kbd>: Main-horizontal
  - <kbd>Meta</kbd>+<kbd>4</kbd>: Main-vertical
  - <kbd>Meta</kbd>+<kbd>5</kbd>: Tiled
- <kbd>Meta</kbd>+<kbd>|</kbd><kbd>-</kbd>: Split window
- <kbd>Meta</kbd>+<kbd>[</kbd><kbd>]</kbd>: Swap pane
- <kbd>Meta</kbd>+<kbd>n</kbd><kbd>p</kbd>: Switch window
- <kbd>Shift</kbd>+<kbd>Meta</kbd>+<kbd>n</kbd><kbd>p</kbd>: Switch session
- <kbd>Meta</kbd>+<kbd>c</kbd>: New window
- <kbd>Meta</kbd>+<kbd>d</kbd>: Detach session
- <kbd>Meta</kbd>+<kbd>q</kbd>: Kill pane
- <kbd>Shift</kbd>+<kbd>Meta</kbd>+<kbd>q</kbd>: Kill window
- <kbd>Meta</kbd>+<kbd>r</kbd>: Rename window
- <kbd>Shift</kbd>+<kbd>Meta</kbd>+<kbd>r</kbd>: Rename session
- <kbd>Meta</kbd>+<kbd>w</kbd>: Show switcher
- <kbd>Meta</kbd>+<kbd>s</kbd>: Enter copy mode
  - <kbd>Space</kbd>: Begin selection
  - <kbd>Return</kbd>: Copy selection
- <kbd>Meta</kbd>+<kbd>v</kbd>: Paste buffer

### zsh

- <kbd>Control</kbd>+<kbd>[</kbd> (<kbd>Esc</kbd>): Enter normal mode (vicmd)
- <kbd>Control</kbd>+<kbd>f</kbd>: Complete suggestion
- <kbd>Control</kbd>+<kbd>r</kbd>: Show history finder

### Neovim

<kbd>Leader</kbd> is <kbd>Space</kbd>.

#### Normal mode

- <kbd>Control</kbd>+<kbd>n</kbd><kbd>p</kbd>: Switch buffer
- <kbd>Control</kbd>+<kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd>: Select pane
- <kbd>Leader</kbd><kbd>a</kbd>: `:CocAction` (Show coc.nvim actions)
- <kbd>Leader</kbd><kbd>b</kbd>: `:Buffers` (Show buffer list)
- <kbd>Leader</kbd><kbd>f</kbd>: `:FZF` (Show file finder)
- <kbd>Leader</kbd><kbd>g</kbd><kbd>a</kbd>: `:Gwrite` (`git add`)
- <kbd>Leader</kbd><kbd>g</kbd><kbd>b</kbd>: `:Gblame` (`git blame`)
- <kbd>Leader</kbd><kbd>g</kbd><kbd>c</kbd>: `:Gcommit` (`git commit`)
- <kbd>Leader</kbd><kbd>g</kbd><kbd>d</kbd>: `:Gdiff` (`git diff`)
- <kbd>Leader</kbd><kbd>g</kbd><kbd>e</kbd>: `:GFiles?` (Show modified file finder)
- <kbd>Leader</kbd><kbd>g</kbd><kbd>f</kbd>: `:GFiles` (Show Git file finder)
- <kbd>Leader</kbd><kbd>g</kbd><kbd>g</kbd>: `:GitGutterToggle` (Toggle Git diff sign)
- <kbd>Leader</kbd><kbd>g</kbd><kbd>i</kbd>: `:Git` (Invoke git command)
- <kbd>Leader</kbd><kbd>g</kbd><kbd>s</kbd>: `:Gstatus` (`git status`)
- <kbd>Leader</kbd><kbd>r</kbd>: `:QuickRun` (Run buffer)
- <kbd>Leader</kbd><kbd>s</kbd>: `:Startify` (Show start page)

#### Insert mode

- <kbd>Control</kbd>+<kbd>Space</kbd>: Show completion popup

## License

[MIT License](./LICENSE)
