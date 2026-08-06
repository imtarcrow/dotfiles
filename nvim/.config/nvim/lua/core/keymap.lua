-- Diagnostics
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LSPKeymap", { clear = true }),

    callback = function(args)
        local telescope = require("telescope.builtin")
        local opts = { buffer = args.buf }

        -- Navigation
        vim.keymap.set("n", "gd", telescope.lsp_definitions, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gy", telescope.lsp_type_definitions, opts)
        vim.keymap.set("n", "gi", telescope.lsp_implementations, opts)
        vim.keymap.set("n", "gr", telescope.lsp_references, opts)

        -- Code
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>cf", function()
            vim.lsp.buf.format({ async = true })
        end, opts)

        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover({
                border = "rounded",
                max_width = 80,
                max_height = 20,
            })
        end, opts)

        -- Symbols
        vim.keymap.set("n", "<leader>ss", telescope.lsp_document_symbols, opts)
        vim.keymap.set("n", "<leader>sS", telescope.lsp_dynamic_workspace_symbols, opts)

        -- Inlay hints
        vim.keymap.set("n", "<leader>th", function()
            local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf })
            vim.lsp.inlay_hint.enable(not enabled, { bufnr = args.buf })
        end, opts)
    end,
})
