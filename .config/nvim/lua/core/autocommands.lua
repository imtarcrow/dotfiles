-- Autocommand for formatting code before save
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp", { clear = true }),
    callback = function(args)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                vim.lsp.buf.format({ async = false, id = args.data.client_id })
            end,
        })
    end,
})

-- Autocommand for Highlighting Yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("yank", { clear = true }),
    callback = function(args)
        vim.hl.on_yank({ higroup = "Visual", timeout = 75 })
    end,
})
