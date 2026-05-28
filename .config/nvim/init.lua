vim.g.mapleader = " "
vim.g.localmapleader = "\\"

Theme = "github_dark_high_contrast"

-- load the lazy.nvim plugin manager
require("core.lazy")

-- set all options and keybinds
require("core.options")
require("core.keymap")

vim.cmd("colorscheme " .. Theme)
