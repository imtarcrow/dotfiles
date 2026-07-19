# ~/.config/fish/config.fish
set -g fish_greeting ""
set -g fish_autosuggestion_enabled 1  

set -g fish_history_max 10000

set -gx EDITOR nvim
set -gx VISUAL nvim

set -g hydro_color_pwd green
set -g hydro_color_git brblack
set -g hydro_color_start brred
set -g hydro_color_error red
set -g hydro_color_prompt brred
set -g hydro_color_duration bryellow
set -g hydro_fetch true
set -g fish_prompt_pwd_dir_length 10000

fish_default_key_bindings

# rust
fish_add_path $HOME/.cargo/bin
test -f "$HOME/.cargo/env.fish"; and source "$HOME/.cargo/env.fish"
