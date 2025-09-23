# dotfiles

dotfiles, managed using [GNU Stow](https://www.gnu.org/software/stow/) and git.

## Prerequisites

- Install GNU Stow:
  ```bash
  brew install stow      # macOS
  ```

## Usage

Install:

```bash
git clone https://github.com/rickyxiaoyang/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow .
```

To remove symlinks:

```bash
stow -D
```

For now, usage is grouped together with one `stow .` install. However, best practice is to split different configurations into packages and stow them individually (`stow nvim`)
