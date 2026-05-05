return {
    {
        "stevearc/oil.nvim",
        lazy = false,
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
