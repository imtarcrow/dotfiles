Theme = "catppuccin"

vim.g.mapleader = " "
vim.g.localmapleader = "\\"

-- load the lazy.nvim plugin manager
require("core.lazy")

-- set all options and keybinds
require("core.options")
require("core.keymap")
