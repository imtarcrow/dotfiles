return {
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        init = function()
            if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
                require("oil")
            end
        end,
        dependencies = {
            { "nvim-mini/mini.icons" },
        },
        opts = {
            default_file_explorer = true,
            columns = {
                "permissions",
                "mtime",
                "size",
                "icon",
            },
            cleanup_delay_ms = 100,
            lsp_file_methods = {
                enabled = true,
                timeout_ms = 100,
                autosave_changes = true,
            },
            watch_for_changes = true,
            view_options = {
                show_hidden = true,
                natural_order = "fast",
            },
        },
        keys = {
            { "<leader>e", "<CMD>Oil<CR>", desc = "Open the Oil File Manager" },
        },
    },
}
