# oh-my-posh

## Add oh-my-posh, but only for non-default terminals
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/themes/catppuccin_frappe.omp.json)"
fi

# ---

# oh-my-zsh

## Use hyphen-insensitive completion. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

## How long to wait in seconds before auto-fetching from GitHub
GIT_AUTO_FETCH_INTERVAL=2

## Which plugins would you like to load?
## Standard plugins can be found in $ZSH/plugins/
## Custom plugins may be added to $ZSH_CUSTOM/plugins/
## Example format: plugins=(rails git textmate ruby lighthouse)
## Add wisely, as too many plugins slow down shell startup.
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

## Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# ---

# nodenv

## Initialise nodenv
eval "$(nodenv init - zsh)"

# ---

# thefuck

## What the fuck bro
eval $(thefuck --alias)

# ---

# zsh auto-complete

## Add custom auto-complete scripts
fpath=(~/.zsh.d/ $fpath)

# ---

# zsh-syntax-highlighting

## Syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---

# zsh-autosuggestions

## Auto-suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ---

# fzf

## Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# ---

# hstr

## hstr configuration (command history utility)
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
export HSTR_TIOCSTI=y

# ---

# Utilities

## Up and down arrow keys will only search the history for commands that start with the currently typed text
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

## Shift + tab will traverse through suggestions backwards
bindkey '^[[Z' reverse-menu-complete

## Enables tab autocomplete
autoload -Uz compinit && compinit

# ---

# Aliases

## Copy the last command to the clipboard
alias copycmd="fc -ln -1 | pbcopy"

## lazygit
alias lg="lazygit"
