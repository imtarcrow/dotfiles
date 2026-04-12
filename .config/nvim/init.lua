vim.g.mapleader = " "
vim.g.localmapleader = "\\"

Theme = "rose-pine"

-- Load the lazy.nvim plugin manager 
require("core.lazy")

-- set all options and keybinds
require("core.options")
require("core.keymap")

vim.cmd("colorscheme " .. Theme)

