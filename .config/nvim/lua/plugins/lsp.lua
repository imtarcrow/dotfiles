return {
    {
        "mason-org/mason.nvim",
        lazy = false,
        opts = {}
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            require("lsp.config")
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ui = {
                border = "rounded",
            },
            ensure_installed = {
                "rust_analyzer",
                "clangd",
                "lua_ls",
            },
        },
    },
    {
        'alexpasmantier/krust.nvim',
        lazy = true,
        opts = {
            keymap = '<leader>k',
            float_win = {
                border = 'rounded',
                auto_focus = false,
            }
        },
        keys = {
            '<leader>k',
        }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'main',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').install(
                {
                    "rust",
                    "c",
                    "cpp",
                    "lua",
                    "python",
                    "javascript",
                    "typescript",
                    "sql",
                    "json",
                    "xml",
                    "yaml",
                    "toml"
                })
        end
    }
}
