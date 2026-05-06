return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        dependencies = {
            { "nvim-mini/mini.icons" },
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build =
                "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install",
            },
        },
        opts = {
            defaults = {
                file_ignore_patterns = {
                    ".git",
                },
                borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
            pickers = {
                find_files = {
                    -- no_ignore = true,
                    hidden = true,
                },
            },
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>",                desc = "Find Files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>",                 desc = "Live Grep" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>",                   desc = "Buffers" },
            { "<leader>fs", "<cmd>Telescope treesitter<cr>",                desc = "Treesitter Symbols" },
            { "<leader>cd", "<cmd>Telescope find_files cwd=~/dotfiles<cr>", desc = "Change dotfiles" },
        },
        config = function(_, opts)
            require("telescope").setup(opts)
            require("telescope").load_extension("fzf")

            vim.api.nvim_create_autocmd("User", {
                pattern = "TelescopePreviewerLoaded",
                callback = function()
                    vim.wo.number = true
                end,
            })
        end,
    },
}
