HISTFILE=~/.zsh_histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

zstyle :compinstall filename '/home/tarcrow/.zshrc'

autoload -Uz compinit
compinit

alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'


#Pure prompt (https://github.com/sindresorhus/pure)
fpath+=($HOME/.zsh/pure)

PURE_CMD_MAX_EXEC_TIME=2
PURE_GIT_DELAY_DIRTY_CHECK=180

zstyle ":prompt:pure:git:stash" show yes

autoload -U promptinit; promptinit
prompt pure
