setopt AUTO_CD
setopt CORRECT
setopt GLOB_DOTS
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Setup history file
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE 
setopt SHARE_HISTORY
setopt HIST_VERIFY

HISTFILE=~/.zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Set emacs keybinds
bindkey -e

# Pure promt (https://github.com/sindresorhus/pure)
fpath+=($HOME/.zsh/pure)

# Setup autocompletion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}=A-Z'
setopt COMPLETE_ALIASES

autoload -Uz compinit
if [[ -n ~/.zsh/.zcompdump(#qN.mh+24) ]]; then
  compinit -d ~/.zsh/.zcompdump
else
  compinit -C -d ~/.zsh/.zcompdump
fi 

# bun completions
[ -s "/home/tarcrow/.bun/_bun" ] && source "/home/tarcrow/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Set Pure options
PURE_CMD_MAX_EXEC_TIME=2
PURE_GIT_DELAY_DIRTY_CHECK=180

zstyle ":prompt:pure:git:stash" show yes
zstyle ':prompt:pure:path' color 'green'
zstyle ':prompt:pure:prompt:success' color 'red'

autoload -U promptinit; promptinit
prompt pure
