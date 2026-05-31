vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspMappings", { clear = true }),
    callback = function(args)
        local bufnr = args.buf
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
        vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { buffer = bufnr })

        vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = bufnr })

        vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_workspace_symbols, { buffer = bufnr })
        vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, { buffer = bufnr })

        -- inlay hints
        vim.keymap.set("n", "<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }))
        end, { buffer = bufnr, desc = "Toggle Inlay Hints" })
    end,
})
