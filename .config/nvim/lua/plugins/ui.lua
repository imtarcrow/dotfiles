return {
	-- Themes
	{
		"mellow-theme/mellow.nvim",
		lazy = false,
		prioriy = 1000,
		config = function()
			vim.g.mellow_transparent = true
			vim.g.mellow_bold_booleans = true
			vim.g.mellow_italic_comments = true

			vim.cmd([[colorscheme mellow]])

		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"vague-theme/vague.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
		},
		config = function()
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
					theme = "seoul256",
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
