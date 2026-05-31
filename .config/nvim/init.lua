vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1

vim.g.mapleader = " "
vim.g.localmapleader = "\\"

Theme = "catppuccin"

-- load the lazy.nvim plugin manager
require("core.lazy")

-- set all options and keybinds
require("core.options")
require("core.keymap")

vim.cmd("colorscheme " .. Theme)
