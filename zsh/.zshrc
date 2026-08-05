# zsh auto-complete

## Add custom auto-complete scripts (must be set before oh-my-zsh is sourced)
fpath=(~/.zsh.d/ $fpath)

# ---

# oh-my-zsh

## Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

## Move oh-my-zsh cache dumps into their pre-existing cache directory.
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

## Use hyphen-insensitive completion. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

## How long to wait in seconds before auto-fetching from GitHub
GIT_AUTO_FETCH_INTERVAL=2

## Which plugins would you like to load?
plugins=(eza git git-auto-fetch copybuffer copyfile copypath macos vscode web-search)

## Highlights selection when tabbing through suggested options
zstyle ':completion:*' menu select

## How often to auto-update oh-my-zsh (in days).
zstyle ':omz:update' frequency 7

## eza plugin settings
zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'git-status' yes
zstyle ':omz:plugins:eza' 'header' yes
zstyle ':omz:plugins:eza' 'icons' yes
zstyle ':omz:plugins:eza' 'hyperlink' yes

## Source oh-my-zsh (this also runs compinit internally)
source $ZSH/oh-my-zsh.sh

# ---

# Utilities

## Up and down arrow keys will only search history for commands starting with typed text
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

## Shift + tab will traverse through suggestions backwards
bindkey '^[[Z' reverse-menu-complete

# ---

# oh-my-posh

## Add oh-my-posh, but only for non-default terminals
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/custom_prompt.omp.json)"
fi

# ---

# nodenv

## Initialise nodenv
eval "$(nodenv init - zsh)"

# ---

# thefuck

## What the fuck bro
eval "$(thefuck --alias)"

# ---

# zoxide

## Initialise zoxide (must load after oh-my-zsh for completions to work)
eval "$(zoxide init zsh)"

# ---

# mole

## Mole shell completion
if output="$(mole completion zsh 2>/dev/null)"; then eval "$output"; fi

# ---

# fzf

## Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

## Use fd instead of find
export FZF_CTRL_T_COMMAND="fd --type f --hidden --exclude .git"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"

## Preview directories/files
export FZF_CTRL_T_OPTS="--style full --preview 'fzf-preview.sh {}'"
export FZF_ALT_C_OPTS="--style full --preview 'eza --tree --level=2 --color=always {}'"
export FZF_COMPLETION_PATH_OPTS="--style full --preview 'fzf-preview.sh {}'"
export FZF_COMPLETION_DIR_OPTS="--style full --preview 'eza --tree --level=2 --color=always {}'"

# ---

# hstr

## hstr configuration (command history utility)
alias hh=hstr
setopt histignorespace
export HSTR_CONFIG=hicolor
bindkey -s "\C-r" "\C-a hstr -- \C-j"
export HSTR_TIOCSTI=y

# ---

# git-extras

## Auto-completions
source $(brew --prefix)/share/git-extras/git-extras-completion.zsh

# ---

# bat

## Use bat to display man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# ---

# Aliases

## Copy the last command to the clipboard
alias copycmd="fc -ln -1 | pbcopy"

## lazygit
alias lg="lazygit"

## Use bat instead of cat
alias cat='bat --paging=never'

# ---

# zsh-autosuggestions

## Auto-suggestions (must load before zsh-syntax-highlighting)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ---

# zsh-syntax-highlighting

## Syntax highlighting (must be the last thing sourced in the file)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
