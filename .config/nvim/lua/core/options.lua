require("core.autocommands")

vim.g.mapleader = " "
vim.g.localmapleader = "\\"



-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Identation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- UI
vim.opt.showmode = false
-- vim.opt.winborder = "single"
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrap = false
vim.opt.cursorline = true

-- Scrolloff
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8

-- Files
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"

-- disable neovim providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Misc
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.opt.mouse = ""
vim.opt.clipboard = "unnamedplus"
