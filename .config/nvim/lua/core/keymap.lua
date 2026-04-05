
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspMappings", { clear = true}),
    callback = function(args)
        local bufnr = args.buf

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = bufnr})
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = bufnr})

        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, {buffer = bufnr})
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {buffer = bufnr})
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, {buffer = bufnr})
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, {buffer = bufnr})
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, {buffer = bufnr})

        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {buffer = bufnr})
        vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, {buffer = bufnr})
    end
})



vim.keymap.set("n", "<leader>th", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }))
end, { buffer = bufnr, desc = "[T]oggle Inlay [H]ints" })
