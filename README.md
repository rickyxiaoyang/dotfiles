# dotfiles

dotfiles, managed using [GNU Stow](https://www.gnu.org/software/stow/) and git.

## Layout

Each top-level directory is a stow package and mirrors the path it will be linked into, relative to `$HOME`:

```
dotfiles/
  tmux/   .tmux.conf       → ~/.tmux.conf
  zsh/    .zshrc           → ~/.zshrc
  gh/     .config/gh/      → ~/.config/gh/
```

## Prerequisites

```bash
brew install stow      # macOS
```

## Usage

Install:

```bash
git clone https://github.com/rickyxiaoyang/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow tmux           # stow one package
stow tmux zsh gh   # or several at once
```

If stow reports conflicts (existing non-symlink files at the target), either back them up and retry, or use `stow --adopt <pkg>` to pull the existing file into the repo (it overwrites the package's copy — review with `git diff` before committing).

Unstow:

```bash
stow -D tmux
```

## tmux plugins

One-time, per machine:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then start a tmux session and press `prefix + I` (capital I) to install the plugins listed in `tmux/.tmux.conf`.
