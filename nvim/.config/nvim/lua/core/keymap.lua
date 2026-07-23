vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LSPKeymap", { clear = true }),
    callback = function(args)
        local bufnr = args.buf
        vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { buffer = bufnr })
        vim.keymap.set("n", "gD", require("telescope.builtin").lsp_type_definitions, { buffer = bufnr })
        vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { buffer = bufnr })
        vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, { buffer = bufnr })
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover({
                border = "rounded",
                max_width = 80,
                max_height = 20,
            })
        end
        , { buffer = bufnr })

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
        vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { buffer = bufnr })

        vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = bufnr })

        vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, { buffer = bufnr })
        vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, { buffer = bufnr })

        -- inlay hints
        vim.keymap.set("n", "<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }))
        end, { buffer = bufnr, desc = "Toggle Inlay Hints" })
    end,
})
