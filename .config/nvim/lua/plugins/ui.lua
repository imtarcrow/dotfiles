return {
    -- Themes
    {
        'vague-theme/vague.nvim'
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            variant = 'main',
            dim_inactive_windows = true,
        },
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            theme = "wave",
            background = {
                dark = "wave",
            },
            overrides = function(colors)
                local theme = colors.theme
                return {
                    LineNr = { fg = theme.syn.comment, bold = false },
                    EndOfBuffer = {
                        fg = theme.ui.special,
                        bold = true,
                    },
                }
            end,
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                        },
                    },
                },
            },
        },
    },
    {
        "mellow-theme/mellow.nvim",
        lazy = false,
        prioriy = 1000,
        config = function()
            vim.g.mellow_transparent = true
            vim.g.mellow_bold_booleans = true
            vim.g.mellow_italic_comments = true
        end,
    },

    -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        config = function()
            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    sections = {
                        lualine_a = { "mode" },
                        lualine_b = { "branch", "diff", "diagnostics" },
                        lualine_c = { "filename", "filesize" },
                        lualine_x = { "lsp_status", "encoding", "fileformat", "filetype" },
                        lualine_y = { "progress" },
                        lualine_z = { "location" },
                    },
                },
            })
        end,
    },

    -- Gitsigns
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        opts = {
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 0,
                virt_text_pos = "right_align",
            },
        },
    },
}
