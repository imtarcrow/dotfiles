-- autocommand for formatting code before save
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LSPSave", { clear = true }),
    callback = function(args)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                vim.lsp.buf.format({ async = false, id = args.data.client_id })
            end,
        })
    end,
})

-- autocommand for highlighting yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("Yank", { clear = true }),
    callback = function()
        vim.hl.on_yank({ higroup = "Visual", timeout = 75 })
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.bo.filetype == "" then
            vim.cmd("filetype detect")
        end
    end,
})
