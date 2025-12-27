vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			diagnostics = { enable = true },
			inlayHints = {
				enable = true,
				typeHints = true,
				parameterHints = true,
				chainingHints = true,
				lifetimeElisionHints = {
					enable = true,
					useParameterNames = true,
				},
			},
		},
	},
})

vim.lsp.enable("rust_analyzer")
