return {
    {
        "mason-org/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall" },
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        event = "BufReadPre",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("lsp.config")
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "rust_analyzer",
                    "clangd",
                    "lua_ls",
                    "glsl_analyzer"
                },
            })
        end,
    },
}
