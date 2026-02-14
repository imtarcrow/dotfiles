# Setup history file

HISTFILE=~/.zsh/.zsh_history
HISTSIZE=2500
SAVEHIST=2500

# Set emacs keybinds
bindkey -e

# Setup autocompletion
zstyle :compinstall filename '/home/tarcrow/.zshrc'
autoload -Uz compinit
compinit

# Pure promt (https://github.com/sindresorhus/pure)
fpath+=($HOME/.zsh/pure)

# Set Pure options
PURE_CMD_MAX_EXEC_TIME=2
PURE_GIT_DELAY_DIRTY_CHECK=180

zstyle ":prompt:pure:git:stash" show yes

autoload -U promptinit; promptinit
prompt pure
