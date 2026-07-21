# dotfiles

Dot files config managed with [GNU Stow](https://www.gnu.org/software/stow/).

Includes configs for:

- `zsh` (`.zshrc`, `.zprofile`)
- `git`
- `hammerspoon`
- `bat`
- `gh`
- `gh-dash`
- `nvim`
- `ohmyposh`
- `wezterm`

## Installation

Each top-level folder is a "package" managed by `stow`. Its internal path mirrors where the files should land relative to `$HOME`. After cloning the repo, run the command below to set up the dotfiles:

```bash
stow zsh git hammerspoon bat gh gh-dash nvim ohmyposh wezterm
```
