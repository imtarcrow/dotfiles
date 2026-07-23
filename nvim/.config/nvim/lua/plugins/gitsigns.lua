return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        opts = {
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text_pos = "right_align",
            },
        },
    },
}
