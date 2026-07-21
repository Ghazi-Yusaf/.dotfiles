# brew

## Add brew command
eval "$(/opt/homebrew/bin/brew shellenv)"

# ---

# Python

## Add Python to $PATH
export PATH="/opt/homebrew/opt/python@3.14/libexec/bin:$PATH"

# ---

# Ruby

## Add Ruby to $PATH
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

## Add Ruby gems to $PATH
export PATH="/opt/homebrew/lib/ruby/gems/4.0.0/bin:$PATH"

## Allows compilers to find ruby
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

## Allows pkgconf to find ruby
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

# ---

# Wine

## Add Wine to $PATH
export MGFXC_WINE_PATH="/Users/gyusaf/.winemonogame"

export PATH="$PATH:/Users/gyusaf/.winemonogame"

# ---

# pip

## Add pipx to $PATH
export PATH="$PATH:/Users/gyusaf/.local/bin"

# ---

# Obsidian

## Add Obsidian CLI to $PATH
export PATH="$PATH:/Applications/Obsidian.app/Contents/MacOS"

# ---

# oh-my-zsh

## Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

## Move oh-my-zsh cache dumps into their pre-existing cache directory.
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# ---

# Microsoft (.NET)

## Opt-out of dotnet telemetry.
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# ---

# julia

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/gyusaf/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
