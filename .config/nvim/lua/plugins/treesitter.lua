return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        commit = "4916d65",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").install({
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
                "toml",
            })
        end,
    },
}
