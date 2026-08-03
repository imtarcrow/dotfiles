return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text_pos = "right_align",
                delay = 500,
            },
        },
        attach_to_untracked = false,
        update_debounce = 200,
        max_file_length = 25000,
    },
}
