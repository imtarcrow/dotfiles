return {
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 100,
		config = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_ui_contrast = "high"
			vim.g.everforest_diagnostic_text_highlight = 1
			vim.g.everforest_diagnostic_virtual_text = "colored"
			vim.g.everforest_better_performance = 1
		end,
	},
	-- {
	--     "sainnhe/sonokai",
	--     lazy = false,
	--     config = function()
	--         vim.g.sonokai_enable_italic = 1
	--         vim.g.sonokai_diagnostic_text_highlight = 1
	--         vim.g.sonokai_diagnostic_virtual_text = "colored"
	--         vim.g.sonokai_better_performance = 1
	--     end,
	-- },
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 100,
		config = function()
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_foreground = "mix"
			vim.g.gruvbox_material_enable_bold = 1
			vim.g.gruvbox_material_enable_italic = 1
			vim.g.gruvbox_material_ui_contrast = "high"
			vim.g.gruvbox_material_diagnostic_text_highlight = 1
			vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
			vim.g.gruvbox_material_statusline_style = "mix"
			vim.g.gruvbox_material_better_performance = 1
		end,
	},
	{
		"vague-theme/vague.nvim",
		lazy = false,
		priority = 100,
		opts = {
			transparent = false,
			bold = true,
			italic = true,
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		opts = {
			variant = "moon",
			extend_background_behind_borders = true,
		},
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 100,
		opts = {
			compile = true,
			theme = "wave",
			background = {
				dark = "wave",
			},
			overrides = function(colors)
				local theme = colors.theme
				return {
					EndOfBuffer = {
						fg = theme.ui.nontext,
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
		priority = 100,
		config = function()
			vim.g.mellow_bold_booleans = true
		end,
	},
}
