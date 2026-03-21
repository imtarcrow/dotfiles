setopt AUTO_CD          # type a dir name to cd into it
setopt CORRECT          # suggest corrections for typos
setopt GLOB_DOTS        # include dotfiles in globs
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'  # ctrl+w stops at slashes

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
zstyle ':completion:*' menu select       # arrow-key navigable menu
zstyle ':completion:*' matcher-list 'm:{a-z}=A-Z'  # case-insensitive
setopt COMPLETE_ALIASES

autoload -Uz compinit
if [[ -n ~/.zsh/.zcompdump(#qN.mh+24) ]]; then
  compinit -d ~/.zsh/.zcompdump
else
  compinit -C -d ~/.zsh/.zcompdump
fi 

# Set Pure options
PURE_CMD_MAX_EXEC_TIME=2
PURE_GIT_DELAY_DIRTY_CHECK=180

zstyle ":prompt:pure:git:stash" show yes

autoload -U promptinit; promptinit
prompt pure
