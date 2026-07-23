Theme = "catppuccin"

-- set all options and keybinds
require("core.options")
require("core.keymap")

-- load the lazy.nvim plugin manager
require("core.lazy")

vim.cmd("colorscheme " .. Theme)
