
git submodule update --init --recursive

mkdir -p "$HOME/.zsh"

[ ! -d $HOME/.zsh/pure ] && git clone https://github.com/sindresorhus/pure $HOME/.zsh/pure

stow .
