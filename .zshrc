HISTFILE=~/.zsh_histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

zstyle :compinstall filename '/home/tarcrow/.zshrc'

autoload -Uz compinit
compinit

alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

