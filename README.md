# dotfiles

[![CI](https://github.com/livewing/dotfiles/workflows/CI/badge.svg)](https://github.com/livewing/dotfiles/actions?query=workflow%3ACI)
[![LICENSE](https://img.shields.io/github/license/livewing/dotfiles)](./LICENSE)

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

## X11 components (for Linux)

- [LightDM](https://github.com/canonical/lightdm) -- Display manager
- [light-locker](https://github.com/the-cavalry/light-locker) -- Screen locker
- [i3](https://i3wm.org/) -- Tiling window manager
- [i3blocks](https://github.com/vivien/i3blocks) -- Status bar
- [Alacritty](https://github.com/alacritty/alacritty) -- Terminal emulator
- [rofi](https://github.com/davatorium/rofi) -- Launcher

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
$ git clone https://github.com/livewing/dotfiles.git
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
- `$HOME/.xprofile.local`
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

### i3

<kbd>$mod</kbd> is <kbd>Super</kbd> (<kbd>Windows</kbd>).

- <kbd>$mod</kbd>+<kbd>Return</kbd>: Launch [Alacritty](https://github.com/alacritty/alacritty)
- <kbd>$mod</kbd>+<kbd>Space</kbd>: Launch [rofi](https://github.com/davatorium/rofi)
- <kbd>$mod</kbd>+<kbd>Shift</kbd>+<kbd>x</kbd>: Lock screen
- <kbd>$mod</kbd>+<kbd>q</kbd>: Close window
- <kbd>$mod</kbd>+<kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd>: Change focus
- <kbd>$mod</kbd>+<kbd>Shift</kbd>+<kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd>: Move focused window
- <kbd>$mod</kbd>+<kbd>a</kbd>: Split horizontally
- <kbd>$mod</kbd>+<kbd>o</kbd>: Split vertically
- <kbd>$mod</kbd>+<kbd>f</kbd>: Toggle fullscreen
- <kbd>$mod</kbd>+<kbd>c</kbd>: Stacked layout
- <kbd>$mod</kbd>+<kbd>t</kbd>: Tabbed layout
- <kbd>$mod</kbd>+<kbd>s</kbd>: Toggle split
- <kbd>$mod</kbd>+<kbd>d</kbd>: Toggle floating
- <kbd>$mod</kbd>+<kbd>Shift</kbd>+<kbd>d</kbd>: Change focus between tiling / floating
- <kbd>$mod</kbd>+<kbd>p</kbd>: Focus parent
- <kbd>$mod</kbd>+<kbd>i</kbd>: Focus child
- <kbd>$mod</kbd>+<kbd>1</kbd><kbd>2</kbd><kbd>3</kbd><kbd>4</kbd><kbd>5</kbd><kbd>6</kbd><kbd>7</kbd><kbd>8</kbd><kbd>9</kbd><kbd>0</kbd>: Switch to workspace
- <kbd>$mod</kbd>+<kbd>Shift</kbd>+<kbd>1</kbd><kbd>2</kbd><kbd>3</kbd><kbd>4</kbd><kbd>5</kbd><kbd>6</kbd><kbd>7</kbd><kbd>8</kbd><kbd>9</kbd><kbd>0</kbd>: Move focused container to workspace
- <kbd>$mod</kbd>+<kbd>Shift</kbd>+<kbd>c</kbd>: Reload i3 configurations
- <kbd>$mod</kbd>+<kbd>Shift</kbd>+<kbd>r</kbd>: Restart i3
- <kbd>$mod</kbd>+<kbd>Shift</kbd>+<kbd>q</kbd>: Logout
- <kbd>$mod</kbd>+<kbd>r</kbd>: Enter resize mode
  - <kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd>: Resize window
  - <kbd>Return</kbd>: Back to normal mode
  - <kbd>Esc</kbd>: Back to normal mode
  - <kbd>$mod</kbd>+<kbd>r</kbd>: Back to normal mode

## License

[MIT License](./LICENSE)
