vim.g.mapleader = " "
vim.g.localmapleader = "\\"

-- Load the lazy.nvim plugin manager 
require("core.lazy")

-- set all options and keybinds
require("core.options")
require("core.keymap")

vim.cmd("colorscheme kanagawa")
