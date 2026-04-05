
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
vim.opt.winborder = "single"
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wrap = false

-- Scrolloff
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Files
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"

vim.opt.mouse = ""
vim.opt.clipboard = "unnamedplus"
